# Miriam Jańczak 229761
# 26.11.2017
# Obliczanie miejsca zerowego funkcji metodą bisekcji

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
