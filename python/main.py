from pathlib import Path
from minecraft.argument.nbt import Storage
from minecraft.command.data import Data
from minecraft.argument.nbt import IntTag
from aaaa.gomi import ok
from minecraft.datapack.function import McFunction


print(Data.Modify(Storage("test").a).Set.String(Storage("test").b, -1, 1))
print(Data.Modify(Storage("test").a).Set.From(Storage("test").b))
print(Data.Modify(Storage("test").a).Insert(10).Value(IntTag(10)))
print(ok)

McFunction.export(Path(__file__).parent.parent)