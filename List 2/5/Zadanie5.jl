# Miriam Jańczak 229761
# 12.11.2017
# Program calculates 40 iterations for population growth model

using Plots
plotly()

# Function calculates given number of iterations for given parameters
# T - type, p - starting point, r - given constant, n - number of iterations
function logical_iterate(T,p,r,n)
    P = zeros(T, n)
    next_p = T(p)
    for i = 1 : n
        next_p = p + r * p * (T(1.0) - p)
        p = next_p
        P[i] = p
    end
    return P
end

# Prints results from array
# P - array with calculated iterations
function print_results(P)
    for i = 1:length(P)
        println("$i:\t$(P[i])")
    end
end

n = 40              # number of iterations
partial_n = 10      # number of iterations for interrupted experiment
p = 0.01            # starting value
r = 3               # constant

T = Float32
println("Float32 without modifications")
A = logical_iterate(T,T(p),r,n)
print_results(A)
println("\nFloat32 with modification")
B = logical_iterate(T,T(p),r,partial_n)
B[partial_n] = floor(B[partial_n],3)        #cuts to third place after comma
B1 = logical_iterate(T,B[partial_n],r,n-partial_n)
append!(B,B1)
print_results(B)

T = Float64
println("\nFloat64")
C = logical_iterate(T,T(p),r,n)
print_results(C)

# D = zeros(T, n)
# E = zeros(n+1)
# for i = 1:n
#     E[i] = i
#     D[i] = abs(A[i] - C[i])
#     # println(i,"&",A[i],"&",C[i]," \\\\")
#     #@printf("%d&%.7e&%.7e \\\\\n",i,A[i],B[i])
# end
# plt = plot(E,D,legend=false)
# display(plt)
