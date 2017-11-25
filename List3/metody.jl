# Miriam Jańczak 229761
# 26.11.2017
# Moduł z metodami obliczania miejs zerowych funkcji

module metody
export mbisekcji, mstycznych, msiecznych


# Funkcja oblicza miesjce zerowe podanej funkcji f za pomocą metody bisekcji
# f - dana funkcja; a, b - końce przedziału początkowego; delta, epsilon - dokładności obliczeń
function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    u = f(a)    # wartość f w punkcie a (początek przedziału)
    v = f(b)    # wartość f w punkcie b (koniec przedziału)
    e = b - a   # długość (a, b)
    it = 0      # liczba iteracji
    if (sign(u) == sign(v)) # funkcja nie zmienia znaku w przedziale [a,b]
        return "err", "err", "err", 1
    end

    while e > epsilon
        it += 1
        e = e / 2   # połowa długości przedziału
        c = a + e   # środek przedziału
        w = f(c)    # wartość f w środku przedziału

        if (abs(e) < delta || abs(w) < epsilon) # warunek końca
            return c, w, it, 0
        end

        if (sign(w) != sign(u))
            b = c
            v = w
        else
            a = c
            u = w
        end
    end
end


# Funkcja oblicza miesjce zerowe podanej funkcji f za pomocą metody Newtona
# f, pf - dana funkcja i jej pochodna; x0 - przybliżenie początkowe;
# delta, epsilon - dokładności obliczeń; maxit - maksymalna dopuszczalna liczba iteracji
function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    v = f(x0)               # wartość f w x0

    if(abs(v) < epsilon)    # wartość f w x0 jest bliska 0
        return x0, v, 0, 0
    end

    if (abs(pf(x0)) < epsilon)      # pochodna bliska zeru
        return "err", "err", "err", 2
    end

    for it = 1 : maxit
        x1 = x0 - (v/pf(x0))   # następne przybliżenie rozwiązania
        v = f(x1)              # wartość f w następnym przybliżeniu

        if(abs(x1 - x0) < delta || abs(v) < epsilon)    # warunek końca
            return x1, v, it, 0
        end
        x0 = x1                # zmiana punktu początkowego
    end

    return "err", "err", "err", 1   # err jeśli nie osiągnięto wyniku w max iteracji
end


# Funkcja "swap" zamienia x i y
function swap(x::Float64, y::Float64)
    temp = x
    x = y
    y = temp
end

# Funkcja oblicza miesjce zerowe podanej funkcji f za pomocą metody siecznych
# f - dana funkcja; x0, x1 - przybliżenia początkowe;
# delta, epsilon - dokładności obliczeń; maxit - maksymalna dopuszczalna liczba iteracji
function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    fx0 = f(x0)         # wartość f w x0
    fx1 = f(x1)         # wartość f w x1

    for it = 1 : maxit
        if (abs(fx0) > abs(fx1))    # zamiana x0 z x1 jeśli odległość od zera
            swap(x0,x1)             # fx0 jest większa niż fx1
            swap(fx0,fx1)
        end

        s = (x1 - x0)/(fx1 - fx0)
        x1 = x0
        fx1 = fx0
        x0 = x0 - (fx0 * s)         # następne x0 w punkcie przecięcia się siecznej z OX
        fx0 = f(x0)                 # wartość funkcji w nowym x0

        if (abs(x1 - x0) < delta || abs(fx0) < epsilon)     # warunek końca
            return x0, fx0, it, 0
        end
    end

    return "err", "err", "err", 1   # err jeśli nie osiągnięto wyniku w max iteracji
end

end
