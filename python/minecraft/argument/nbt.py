from __future__ import annotations
from dataclasses import dataclass


class NbtTag:
    pass


@dataclass
class IntTag(NbtTag):
    __value__: int

    def __str__(self) -> str:
        return str(self.__value__)


@dataclass
class CompoundTag(NbtTag):
    __value__: dict[str, NbtTag]

    def __init__(self, **kwargs: NbtTag):
        self.__value__ = kwargs

    def __str__(self) -> str:
        return "{" + ",".join(k + ":" + str(v) for k, v in self.__value__.items()) + "}"


class NbtHolder:
    pass

    def __getattr__(self, __name: str) -> NbtPath:
        return NbtPath(self, (NbtRootSegment(__name),))

    def __call__(self, arg: CompoundTag | None = None) -> NbtPath:
        if arg is None:
            return NbtPath(self, ())
        return NbtPath(self, (NbtMatchSegment(arg),))

    def __getitem__(self, index: str):
        return NbtPath(self, (NbtRootSegment(index),))


@dataclass
class Storage(NbtHolder):
    def __str__(self) -> str:
        return "storage " + self.location

    location: str


class NbtSegment:
    pass


@dataclass
class NbtRootSegment(NbtSegment):
    def __str__(self) -> str:
        return self.name

    name: str


@dataclass
class NbtChildSegment(NbtSegment):
    def __str__(self) -> str:
        return "." + self.name

    name: str


@dataclass
class NbtMatchSegment(NbtSegment):
    def __str__(self) -> str:
        return f"{self.value}"

    value: CompoundTag


@dataclass
class NbtIndexSegment(NbtSegment):
    def __str__(self) -> str:
        return f"[{self.index}]"

    index: int


@dataclass
class NbtFilterSegment(NbtSegment):
    def __str__(self) -> str:
        return f"[{self.value}]"

    value: CompoundTag


@dataclass
class NbtAllSegment(NbtSegment):
    def __str__(self) -> str:
        return "[]"


class NbtPathError(Exception):
    pass


@dataclass
class NbtPath:
    __holder__: NbtHolder
    __segments__: tuple[NbtSegment, ...]

    def __post_init__(self):
        match self.__segments__:
            case (
                *_,
                NbtAllSegment() | NbtIndexSegment() | NbtFilterSegment() | NbtMatchSegment(),
                NbtMatchSegment(),
            ) | (NbtAllSegment() | NbtIndexSegment() | NbtFilterSegment()) | (
                *_,
                NbtMatchSegment(),
                NbtAllSegment() | NbtIndexSegment() | NbtFilterSegment(),
            ):
                raise NbtPathError(f"invalid NbtPath : {self}")

    def __str__(self) -> str:
        if self.__segments__:
            return f'{self.__holder__} {"".join(map(str,self.__segments__))}'
        return f"{self.__holder__} {{}}"

    def __getattr__(self, name: str) -> NbtPath:
        return NbtPath(self.__holder__, (*self.__segments__, NbtChildSegment(name)))

    def __call__(self, arg: CompoundTag) -> NbtPath:
        return NbtPath(self.__holder__, (*self.__segments__, NbtMatchSegment(arg)))

    def __getitem__(self, index: str | int | CompoundTag | None):
        if index is None:
            return NbtPath(self.__holder__, (*self.__segments__, NbtAllSegment()))

        elif isinstance(index, str):
            return NbtPath(self.__holder__, (*self.__segments__, NbtChildSegment(index)))

        elif isinstance(index, int):
            return NbtPath(self.__holder__, (*self.__segments__, NbtIndexSegment(index)))

        elif isinstance(index, CompoundTag):
            return NbtPath(self.__holder__, (*self.__segments__, NbtFilterSegment(index)))
