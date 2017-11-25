# Miriam Jańczak 229761
# 26.11.2017
# Obliczanie miejsca zerowego funkcji metodą siecznych

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
