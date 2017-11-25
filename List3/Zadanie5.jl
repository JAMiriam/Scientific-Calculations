# Miriam Jańczak 229761
# 26.11.2017
# Znalezienie wartości zmiennej x, dla której przecinają się wykresy funkcji y = 3x i y = e^x

include("metody.jl")
using metody

# Funkcja posiadająca zera w punktach przecięcia się funkcji 3x i e^x
# x - argument funkcji
f(x) = e^x - 3.0 * x
delta = 10.0^-4.0         # dokładność obliczeń
epsilon = 10.0^-4.0       # dokładność obliczeń

# Szacujemy przedziały dla dwóch miejsc zerowych funkcji f
println("Wartości x, dla których przecinają się wykresy funkcji 3x i e^x")

println("Dla x1: ") # przedział (0,1)
(r,v,it,err) = mbisekcji(f, 0.0, 1.0, delta, epsilon)
println("x1: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")

println("Dla x2: ")
(r,v,it,err) = mbisekcji(f, 1.0, 2.0, delta, epsilon) # przedział (1,2)
println("x2: $(r)\t v: $(v)\t it: $(it)\t err: $(err)")
