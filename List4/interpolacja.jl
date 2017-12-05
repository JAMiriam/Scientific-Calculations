# Miriam Jańczak 229761
# 10.12.2017
# Moduł z odpowiednimi metodami

module interpolacja
export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx

using Plots
plotly()

# Funkcja obliczająca ilorazy różnicowe
# in: x - wektor zawierający węzły, f - wektor zawierający wartości funkcji w węzłach
# out: fx - wektor zawierający obliczone ilorazy różnicowe
function ilorazyRoznicowe(x :: Vector{Float64}, f :: Vector{Float64})

    n = length(f)             # długość wektorów
    fx = Vector{Float64}(n)   # deklaracja wektora z ilorazami różnicowymi

    for i = 1 : n             # przekopiowanie wartości funkcji interpolowanej
        fx[i] = f[i]
    end

    for i = 2 : n              # obliczanie ilorazów różnicowych
		for j = n : -1 : i
			fx[j] = (fx[j] - fx[j - 1]) / (x[j] - x[j - i + 1])
		end
	end

    return fx
end


# Funkcja obliczająca wartość wielomianu interpolacyjnego w postaci Newtona
# za pomocą uogólnionego algorytmu Hornera
# in: x - wektor zawierający węzły, fx - wektor zawierający ilorazy różnicowe
# in: t - punkt w którym należy obliczyć wartość wielomianu
# out: nt - wartość wielomiau w punkcie t
function warNewton(x :: Vector{Float64}, fx :: Vector{Float64}, t :: Float64)

    nt :: Float64       # wartość wielomianu w punkcie t - deklaracja
    n = length(fx)      # długość wektorów
    nt = fx[n]

	for i = n-1 : -1 : 1
		nt = fx[i]+(t-x[i])*nt
	end

    return nt
end


# Funkcja obliczająca współczynniki wielomianu interpolacyjnego w postaci normalnej
# in: x - wektor zawierający węzły, fx - wektor zawierający ilorazy różnicowe
# out: a - wektor zawierający współczynniki w postaci normalnej
function naturalna(x :: Vector{Float64}, fx :: Vector{Float64})
    n = length(fx)                  # długość wektorów
    a = Vector{Float64}(n)          # współczynniki w postaci normalnej
    a[n] = fx[n]                    # z twierdzenia a_n = c_n
    for k = n-1 : -1 : 1            # idea pętli: obliczamy kolejne wartości częściowe
        a[k] = fx[k]-a[k+1]*x[k]    # jak w zadaniu poprzednim, tak że w każdej iteracji k
        for i = k+1 : n-1           # doprowadzamy do "częściowej" postaci normalnej
            a[i] = a[i]-a[i+1]*x[k]
        end
    end
    return a
end


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
end
