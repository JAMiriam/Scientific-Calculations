include("metody.jl")
using metody

f(x) = x^2 - 16
g(x) = x^4 - 16
pf(x) = 2*x
pg(x) = 4*(x^3)

delta = 10.0^-6.0
epsilon = 10.0^-6.0
maxit = 64

println("x^2 - 16")

println("Metoda bisekcji: ")
(r,v,it,err) = mbisekcji(f, 2.0, 5.5, delta, epsilon)
println("r: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")

println("Metoda stycznych: ")
(r,v,it,err) = mstycznych(f, pf, 6.0, delta, epsilon, maxit)
println("r: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")

println("Metoda siecznych: ")
(r,v,it,err) = msiecznych(f, 1.0, 5.0, delta, epsilon, maxit)
println("r: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")
println()


println("x^4 - 16")

println("Metoda bisekcji: ")
(r,v,it,err) = mbisekcji(g, 1.5, 6.0, delta, epsilon)
println("r: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")

println("Metoda stycznych: ")
(r,v,it,err) = mstycznych(g, pg, 1.0, delta, epsilon, maxit)
println("r: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")

println("Metoda siecznych: ")
(r,v,it,err) = msiecznych(g, 1.0, 6.5, delta, epsilon, maxit)
println("r: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")
