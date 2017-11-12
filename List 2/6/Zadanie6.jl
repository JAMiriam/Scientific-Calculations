# Miriam Jańczak 229761
# 12.11.2017
# Program calculates iterations of function x_n+1 = x_n^2 + c for given c and x_0

# Function calculates given number of iterations for given parameters
# T - type, x - starting point, c - controll parameter, n - number of iterations
function iterate_fun(T,x,c,n)
    xs = zeros(T, n)
    for i = 1 : n
        next_x = x^T(2.0)+c
        x = next_x
        xs[i] = x
        println("x$(i):\t$(x)")
    end
    return xs
end

n = 40          # number of iterations
T = Float64     # type
cs = T[-2.0,-2.0, -2.0, -1.0, -1.0, -1.0, -1.0,]            # array of x_0s
x0 = T[1.0, 2.0, 1.99999999999999, 1.0, -1.0, 0.75, 0.25]   # array of cs
pl = Array[zeros(n),zeros(n),zeros(n),zeros(n),zeros(n),zeros(n),zeros(n)]

# Running program for different pairs of c and x_0 represented in arrays cs and x0
for i = 1 : length(x0)
    println("x0=$(x0[i]), c=$(cs[i])")
    pl[i] = iterate_fun(T,T(x0[i]),T(cs[i]),n)
    println()
end

# for i = 1 : n
#     print(i)
#     for j = 1 : length(x0)
#         print("&$(pl[j][i])")
#     end
#     println(" \\\\")
# end
