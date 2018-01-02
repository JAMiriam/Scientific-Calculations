# Miriam Jańczak 229761
# 03.01.2018
# Moduł z metodami rozwiązującymi układ równań liniowych z zadaną macierzą

module blocksys
export read_matrix, read_vector, gaussian_elimination,
gaussian_elimination_with_pivots, right_side_vector, write_solution,
matrix_to_LU, solve_from_LU, matrix_to_LU_with_pivots, solve_from_LU_with_pivots


# Funkcja wczytująca macierz z pliku
# in:	file_path - ścieżka do pliku z macierzą
# out:	A - macierz rzadka wczytana z pliku, n - rozmiar macierzy,
#		l - wielkość bloku
function read_matrix(file_path::String)
	open(file_path) do file
		ln = split(readline(file))
		n = parse(Int64, ln[1])
		l = parse(Int64, ln[2])
		el_num = n*l + 3*(n-l)
		J = Array{Int64}(el_num)
		I = Array{Int64}(el_num)
		V = Array{Float64}(el_num)
		it = 1
		while !eof(file)
			ln = split(readline(file))
			J[it] = parse(Int64, ln[1])
			I[it] = parse(Int64, ln[2])
			V[it] = parse(Float64, ln[3])
			it += 1
		end
		A = sparse(I, J, V)
		return (A, n, l)
	end
end


# Funkcja wczytująca wektor prawych stron z pliku
# in:	file_path - ścieżka do pliku z wektorem
# out:	b - wczytany wektor
function read_vector(file_path::String)
	open(file_path) do file
		n = parse(Int64, readline(file))
		b = Array{Float64}(n)
		it = 0 #1
		while !eof(file)
			b[++it] = parse(Float64, readline(file))
			# it += 1
		end
		return b
	end
end


# Funkcja zapisująca rozwiązanie układu równań do pliku
# in:	file_path - ścieżka do pliku zapisowego, x - wektor z rozwiązaniem,
#		n - rozmiar macierzy, err - wybór zapisu błędu względnego
function write_solution(file_path::String, x::Array{Float64}, n::Int64, err::Bool)
	open(file_path, "w") do file
		if (err)
			relative_error = norm(ones(n) - x) / norm(x)
			println(file, relative_error)
		end
		for i in 1 : n
			println(file, x[i])
		end
	end
end


# Funkcja obliczająca wektor prawych stron dla zadanej macierzy
# i wektora jednostkowego
# in:	A - zadana macierz, n - rozmiar macierzy
# out:	b - obliczony wektor prawych stron
function right_side_vector(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
	b = Array{Float64}(n)
	for i in 1 : n
		from_col = convert(Int64, max(l * floor((i-1) / l) - 1, 1))
		last_col = convert(Int64, min(l + l * floor((i-1) / l), n))
		for j in from_col : last_col
			b[i] += A[j, i]
		end

		if (i + l <= n)
			b[i] += A[i + l, i]
		end
	end
	return b
end


# Funkcja rozwiązująca układ równań liniowych metodą eliminacji Gaussa
# bez wyboru elementu głównego dla macierzy o zadanej budowie
# in:	A - zadana macierz, n - rozmiar macierzy, l - wielkość bloku,
#		b - wektor prawych stron
# out:	x - rozwiązanie układu
function gaussian_elimination(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64, b::Vector{Float64})
	for k in 1 : n-1
		last_row = convert(Int64, min(l + l * floor((k+1) / l), n))
		last_col = convert(Int64, min(k + l, n))
		for i in k + 1 : last_row
			if abs(A[k,k]) < eps(Float64)
				error("Współczynnik na przekątnej równy 0. Nie można zastosować metody.")
			end
			z = A[k, i] / A[k, k]
			A[k, i] = 0
			for j in k + 1 : last_col
				A[j, i] = A[j, i] - z * A[j, k]
			end
			b[i] = b[i] - z * b[k]
		end
	end

	x = Array{Float64}(n)
	for i in n : -1 : 1
		prev_total = 0.0
		last_col = min(n, i + l)
		for j in i + 1 : last_col
			prev_total += A[j, i] * x[j]
		end
		x[i] = (b[i] - prev_total) / A[i, i]
	end
	return x
end


# Funkcja rozwiązująca układ równań liniowych metodą eliminacji Gaussa
# z częściowym wyborem elementu głównego dla macierzy o zadanej budowie
# in:	A - zadana macierz, n - rozmiar macierzy, l - wielkość bloku,
#		b - wektor prawych stron
# out:	x - rozwiązanie układu
function gaussian_elimination_with_pivots(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64, b::Vector{Float64})
	p = collect(1:n)

	for k in 1:n - 1
		last_row = convert(Int64, min(l + l * floor((k+1) / l), n))
		last_col = convert(Int64, min(2*l + l*floor((k+1)/l), n))
		for i in k + 1 : last_row
			max_row = k
			max = abs(A[k,p[k]])
			for x in i : last_row
				if (abs(A[k,p[x]]) > max)
					max_row = x;
					max = abs(A[k,p[x]])
				end
			end
			if (abs(max) < eps(Float64))
				error("Macierz osobliwa.")
			end
			p[k], p[max_row] = p[max_row], p[k]
			z = A[k,p[i]] / A[k,p[k]]
			A[k,p[i]] = 0
			for j in k + 1 : last_col
				A[j,p[i]] = A[j,p[i]] - z * A[j,p[k]]
			end
			b[p[i]] = b[p[i]] - z * b[p[k]]
		end
	end

	x = Array{Float64}(n)
	for i in n : -1 : 1
		prev_total = 0.0
		last_col = convert(Int64, min(2*l + l*floor((p[i]+1)/l), n))
		for j in i + 1 : last_col
			prev_total += A[j,p[i]] * x[j]
		end
		x[i] = (b[p[i]] - prev_total) / A[i, p[i]]
	end
	return x
end

# Funkcja obliczająca rozkład LU bez wyboru elementu głównego
# dla macierzy o zadanej budowie
# in:	A - zadana macierz, n - rozmiar macierzy, l - wielkość bloku
function matrix_to_LU(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
	for k in 1 : n-1
		last_row = convert(Int64, min(l + l * floor((k+1) / l), n))
		last_col = convert(Int64, min(k + l, n))
		for i in k + 1 : last_row
			if abs(A[k,k]) < eps(Float64)
				error("Współczynnik na przekątnej równy 0. Nie można zastosować metody.")
			end
			z = A[k, i] / A[k, k]
			A[k, i] = z
			for j in k + 1 : last_col
				A[j, i] = A[j, i] - z * A[j, k]
			end
		end
	end
end

# Funkcja rozwiązująca układ równań liniowych z rozkładu LU
# stworzonego bez wyboru elementu głównego
# in:	A - macierz w rozkładzie LU, n - rozmiar macierzy, l - wielkość bloku,
#		b - wektor prawych stron
# out:	x - rozwiązanie układu
function solve_from_LU(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64, b::Vector{Float64})
	z = Array{Float64}(n)
	for i in 1 : n
		prev_total = 0.0
		from_col = convert(Int64, max(l * floor((i-1) / l) - 1, 1))
		for j in from_col : i-1
			prev_total += A[j, i] * z[j]
		end
		z[i] = b[i] - prev_total
	end

	x = Array{Float64}(n)
	for i in n : -1 : 1
		prev_total = 0.0
		last_col = min(n, i + l)
		for j in i + 1 : last_col
			prev_total += A[j, i] * x[j]
		end
		x[i] = (z[i] - prev_total) / A[i, i]
	end
	return x
end

# Funkcja obliczająca rozkład LU z częściowym wyborem elementu głównego
# dla macierzy o zadanej budowie
# in:	A - zadana macierz, n - rozmiar macierzy, l - wielkość bloku
# out:	p - wektor permutacji wierszy
function matrix_to_LU_with_pivots(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
	p = collect(1:n)

	for k in 1:n - 1
		last_row = convert(Int64, min(l + l * floor((k+1) / l), n))
		last_col = convert(Int64, min(2*l + l*floor((k+1)/l), n))
		for i in k + 1 : last_row
			max_row = k
			max = abs(A[k,p[k]])
			for x in i : last_row
				if (abs(A[k,p[x]]) > max)
					max_row = x;
					max = abs(A[k,p[x]])
				end
			end
			if (abs(max) < eps(Float64))
				error("Macierz osobliwa.")
			end
			p[k], p[max_row] = p[max_row], p[k]
			z = A[k,p[i]] / A[k,p[k]]
			A[k,p[i]] = z
			for j in k + 1 : last_col
				A[j,p[i]] = A[j,p[i]] - z * A[j,p[k]]
			end
		end
	end
	return p
end

# Funkcja rozwiązująca układ równań liniowych z rozkładu LU
# stworzonego z częściowym wyborem elementu głównego
# in:	A - macierz w rozkładzie LU, n - rozmiar macierzy, l - wielkość bloku,
#		b - wektor prawych stron, p - wektor permutacji wierszy
# out:	x - rozwiązanie układu
function solve_from_LU_with_pivots(A::SparseMatrixCSC{Float64, Int64}, n::Int64,
							l::Int64, b::Vector{Float64}, p::Vector{Int64})
	z = Array{Float64}(n)
	for i in 1 : n
		prev_total = 0.0
		from_col = convert(Int64, max(l * floor((p[i]-1) / l) - 1, 1))
		for j in from_col : i-1
			prev_total += A[j, p[i]] * z[j]
		end
		z[i] = b[p[i]] - prev_total
	end

	x = Array{Float64}(n)
	for i in n : -1 : 1
		prev_total = 0.0
		last_col = convert(Int64, min(2*l + l*floor((p[i]+1)/l), n))
		for j in i + 1 : last_col
			prev_total += A[j, p[i]] * x[j]
		end
		x[i] = (z[i] - prev_total) / A[i, p[i]]
	end
	return x
end

end
