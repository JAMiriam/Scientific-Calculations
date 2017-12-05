# Miriam Jańczak 229761
# 10.12.2017

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

# println(naturalna([1.0,2.0,3.0],[1.0,1.0,0.0]))
# println(naturalna([0.0,1.0,2.0],[-3.0,2.0,2.0]))
