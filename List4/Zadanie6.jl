# Miriam Jańczak 229761
# 10.12.2017
# Program testuje funkcję rysujNnfx dla konkretnych przykładów

include("interpolacja.jl")
using interpolacja

f(x) = abs(x)
g(x) = 1.0 / (1.0 + x^2)

rysujNnfx(f, -1.0, 1.0, 5) 
rysujNnfx(f, -1.0, 1.0, 10)
rysujNnfx(f, -1.0, 1.0, 15)

rysujNnfx(g, -5.0, 5.0, 5)
rysujNnfx(g, -5.0, 5.0, 10)
rysujNnfx(g, -5.0, 5.0, 15)
