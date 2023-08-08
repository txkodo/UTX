from __future__ import annotations
import inspect
from pathlib import Path
from typing import Any, Callable, Iterable
from minecraft.argument.nbt import NbtTag
from minecraft.command.base import Command
from minecraft.argument.resource_location import ResourceLocation


def get_parts(func: Callable):
    modulename = inspect.getmodule(func).__name__
    segments = modulename.split(".")
    segments.append(func.__name__)
    return segments


class McFunction:
    functions: list[McFunction] = []

    @classmethod
    def export(cls, datapack_path: Path):
        for i in cls.functions:
            path = i.location.function_path(datapack_path)
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text("\n".join(map(str, i.commands)))

    def __init__(
        self, func: Callable[[McFunction], NbtTag | None], segments: list[str] | None = None, is_api: bool = True
    ) -> None:
        McFunction.functions.append(self)

        self.commands: list[Command] = []
        self.segments = segments if segments is not None else get_parts(func)
        self.is_api = is_api
        self.i = 0
        func(self)

    def next_core_sagments(self) -> list[str]:
        result = [*self.segments, str(self.i)]
        self.i += 1
        return result

    @property
    def location(self):
        return ResourceLocation(
            ("api" if self.is_api else "core") + "/" + "/".join(self.segments[1:]), self.segments[0]
        )

    def __str__(self) -> str:
        return f"[{self.location}]\n  " + "\n  ".join(map(str, self.commands))

    def __iadd__(self, command: Command | Iterable[Command]):
        if isinstance(command, Command):
            self.commands.append(command)
        else:
            self.commands.extend(command)
        return self

    def __call__(self) -> Any:
        return Command(f"function {self.location}")

    def While(self, func: Callable[[McFunction], NbtTag | None]) -> Any:
        self += McFunction(func, self.next_core_sagments(), False)()
