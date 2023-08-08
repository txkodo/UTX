from minecraft.datapack.function import McFunction


@McFunction
def ok(f: McFunction):
    f += f()
    f += f()
    f += f()
    f += f()

    @f.While
    def _(f: McFunction):
        f += f()
