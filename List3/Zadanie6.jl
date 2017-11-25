# Miriam Jańczak 229761
# 26.11.2017
# Znalezienie miejsc zerowych funkcji e^(1-x)-1 oraz xe^-x metodami bisekcji, Newtona i siecznych

include("metody.jl")
using metody

# Funkcja e^(1-x)-1, x - argument
f(x) = e^(1.0 - x) - 1.0
# Funkcja xe^-x, x - argument
g(x) = x * e^(-x)

# Pochodna funkcji f
pf(x) = -e^(1.0 - x)
# Pochodna funkcji g
pg(x) = e^-x - x * e^-x

delta = 10.0^-5.0               # dokładność obliczeń
epsilon = 10.0^-5.0             # dokładność obliczeń
maxit = 64                      # maksymalna dopuszczalna liczba iteracji

println("y = e^(1-x)-1: ")

println("Metoda bisekcji: ")
(r,v,it,err) = mbisekcji(f, 0.0, 1.5, delta, epsilon)
println("r: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")

println("Metoda stycznych: ")
(r,v,it,err) = mstycznych(f, pf, 0.5, delta, epsilon, maxit)
println("r: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")

println("Metoda siecznych: ")
(r,v,it,err) = msiecznych(f, -1.0, 2.0, delta, epsilon, maxit)
println("r: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")


println("y = xe^-x: ")

println("Metoda bisekcji: ")
(r,v,it,err) = mbisekcji(g, -0.5, 1.0, delta, epsilon)
println("r: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")

println("Metoda stycznych: ")
(r,v,it,err) = mstycznych(g, pg, -0.5, delta, epsilon, maxit)
println("r: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")

println("Metoda siecznych: ")
(r,v,it,err) = msiecznych(g, -1.0, 0.5, delta, epsilon, maxit)
println("r: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")
