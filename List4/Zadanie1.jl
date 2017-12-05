# Miriam Jańczak 229761
# 10.12.2017

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
