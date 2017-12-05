# Miriam Jańczak 229761
# 10.12.2017

# Funkcja interpoluje zadaną funkcję w danym przedziale za pomocą wielomianu w postaci Newtona
# oraz rysuje wielomian interpolacyjny i interpolowaną funkcję.
# in: f -dana funkcja; a, b - końce przedziału; n - stopień wielomianu
function rysujNnfx(f, a :: Float64, b :: Float64, n :: Int)
    x = Vector{Float64}(n+1)        # wektor zawierający węzły
    y = Vector{Float64}(n+1)        # wartości funkcji w kolejnych węzłach
    fx = Vector{Float64}(n+1)       # ilorazy różnicowe dla kolejnych węzłów

    dens = 20                       # mnożnik dla dokładiejszego rysowania wykresów

    img_y = Vector{Float64}(dens*(n + 1))       # wektor wartości funkcji na rysunku
    img_x = Vector{Float64}(dens*(n + 1))       # we    max_k = n + 1ktor węzłów na rysunku
    img_new = Vector{Float64}(dens*(n + 1))     # wartości wielomianu interpolacyjnego w węzłach

    kh = 0.0                                    # kolejne wartości h
    max_k = n + 1                               # maksymalna ilość węzłów
    h = (b-a)/n                                 # krok

    for i = 1: max_k
        x[i] = a + kh
        y[i] = f(x[i])
        kh += h
    end

    fx = ilorazyRoznicowe(x, y);

    kh = 0.0
    max_k *= dens
    h = (b - a)/(max_k-1)

    for i = 1: max_k
        img_x[i] = a + kh
        img_new[i] = warNewton(x, fx, img_x[i])
        img_y[i] = f(img_x[i])
        kh += h
    end

    plt = plot(img_x, [img_y, img_new], linewidth=2.0)
    display(plt)
end
