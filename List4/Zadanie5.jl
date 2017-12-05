# Miriam Jańczak 229761
# 10.12.2017
# Program testuje funkcję rysujNnfx dla konkretnych przykładów

include("interpolacja.jl")
using interpolacja

f(x) = exp(x)
g(x) = x^2 * sin(x)

rysujNnfx(f, 0.0, 1.0, 5)
rysujNnfx(f, 0.0, 1.0, 10)
rysujNnfx(f, 0.0, 1.0, 15)

rysujNnfx(g, -1.0, 1.0 , 5)
rysujNnfx(g, -1.0, 1.0 , 10)
rysujNnfx(g, -1.0, 1.0 , 15)
