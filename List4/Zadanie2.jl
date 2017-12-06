# Miriam Jańczak 229761
# 10.12.2017

# Funkcja obliczająca wartość wielomianu interpolacyjnego w postaci Newtona
# za pomocą uogólnionego algorytmu Hornera
# in: x - wektor zawierający węzły, fx - wektor zawierający ilorazy różnicowe
# in: t - punkt w którym należy obliczyć wartość wielomianu
# out: nt - wartość wielomiau w punkcie t
function warNewton(x :: Vector{Float64}, fx :: Vector{Float64}, t :: Float64)

    nt = 1.0            # wartość wielomianu w punkcie t - deklaracja
    n = length(fx)      # długość wektorów
    nt = fx[n]

	for i = n-1 : -1 : 1
		nt = fx[i]+(t-x[i])*nt
	end

    return nt
end
