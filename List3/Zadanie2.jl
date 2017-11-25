# Miriam Jańczak 229761
# 26.11.2017
# Obliczanie miejsca zerowego funkcji metodą Newtona (stycznych)

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
