include("interpolacja.jl")
using interpolacja

f(x) = x + 9
g(x) = x^2 - 9

rysujNnfx(f, -10.0, 10.0, 3)
rysujNnfx(f, -10.0, 10.0, 20)

rysujNnfx(g, -10.0, 10.0, 3)
rysujNnfx(g, -10.0, 10.0, 20)
