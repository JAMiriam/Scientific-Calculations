include("blocksys.jl")
using blocksys

(A,n,l) = read_matrix("Dane16_1_1/A.txt")
b = read_vector("Dane16_1_1/b.txt")
# println(gaussian_elimination_with_pivots(A, n, l, b))
p = matrix_to_LU_with_pivots(A, n, l)
println(solve_from_LU_with_pivots(A, n, l, b, p))
