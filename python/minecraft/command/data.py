from dataclasses import dataclass
from minecraft.argument.nbt import NbtPath, NbtTag
from minecraft.command.base import Command


@dataclass
class _DataModifyOperation:
    target: NbtPath
    operation: str

    def Value(self, source: NbtTag):
        return Command(f"data modify {self.target} {self.operation} value {source}")

    def From(self, source: NbtPath):
        return Command(f"data modify {self.target} {self.operation} from {source}")

    def String(self, source: NbtPath, start: int | None = None, end: int | None = None):
        match (start, end):
            case (None, None):
                range = ""
            case (int(), None):
                range = f" {start}"
            case (None, int()):
                range = f" 0 {end}"
            case (int(), int()):
                range = f" {start} {end}"
            case _:
                raise AssertionError

        return Command(f"data modify {self.target} {self.operation} string {source}{range}")


@dataclass
class _DataModify:
    target: NbtPath

    @property
    def Set(self):
        return _DataModifyOperation(self.target, "set")

    @property
    def Append(self):
        return _DataModifyOperation(self.target, "append")

    @property
    def Prepend(self):
        return _DataModifyOperation(self.target, "prepend")

    def Insert(self, index: int):
        return _DataModifyOperation(self.target, f"insert {index}")


class Data:
    @classmethod
    def Modify(cls, target: NbtPath):
        return _DataModify(target)

    @classmethod
    def Remove(cls, target: NbtPath):
        return Command(f"data remove {target}")
