# Miriam Jańczak 229761
# 26.11.2017
# Obliczanie miejsca zerowego funkcji sin(x) - (0.5 * x)^2.0 metodami bisekcji, Newtona i siecznych

include("metody.jl")
using metody

# Dana funkcja, x - argument
f(x) = sin(x) - (0.5 * x)^2.0
# Pochodna funkcji f
pf(x) = cos(x) - 0.5 * x

delta = 0.5 * 10.0^-5.0             # dokładność obliczeń
epsilon = 0.5 * 10.0^-5.0           # dokładność obliczeń
maxit = 32                          # maksymalna dopuszczalna liczba iteracji

println("Metoda bisekcji: ")
(r,v,it,err) = mbisekcji(f, 1.5, 2.0, delta, epsilon)
println("r: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")

println("Metoda Newtona: ")
(r,v,it,err) = mstycznych(f, pf, 1.5, delta, epsilon, maxit)
println("r: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")

println("Metoda siecznych: ")
(r,v,it,err) = msiecznych(f, 1.0, 2.0, delta, epsilon, maxit)
println("r: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")
