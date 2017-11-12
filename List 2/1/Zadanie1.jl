#Miriam Jańczak 229761
#12.11.2017
#Program calculates dot product of two given scalars using four different algorithms.

#Float32 arithmetic
x = Float32[2.718281828, -3.141592654, 1.414213562, 0.577215664#=9=#, 0.301029995#=7=#]
y = Float32[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

#a algorithm "forward"
s = Float32(0)
for i = 1 : length(x)
    s += x[i] * y[i]
end
println("a: $(s)")

#b algorithm "backward"
s = Float32(0)
for i in length(x):-1:1
    s += x[i] * y[i]
end
println("b: $(s)")

#5c and d
partials = Float32[]    #partial sums of dot product
for i = 1 : length(x)
    push!(partials,x[i]*y[i]) #calculating partial sums
end

sort!(partials, rev = true)     #sorting partials in reverse order
sc1 = Float32(0)
sd1 = Float32(0)
for i = 1:length(partials)
    if partials[i] > 0
        sc1 += partials[i]  #sum from the largest to the smallest positive number for c algorithm
    else
        sd1 += partials[i]  #sum from the smallest to the largest negative number for d algorithm
    end
end

sort!(partials)
sc2 = Float32(0)
sd2 = Float32(0)
for i = 1:length(partials)
    if partials[i] < 0
        sc2 += partials[i]  #sum from the largest to the smallest negative number for c algorithm
    else
        sd2 += partials[i]  #sum from the smallest to the largest positive number for d algorithm
    end
end

sc = Float32(sc1 + sc2) #sum partial sums for c
sd = Float32(sd2 + sd1) #sum partial sums for d
println("c: $(sc)")
println("d: $(sd)")

#Float64
x = Float64[2.718281828, -3.141592654, 1.414213562, 0.577215664#=9=#, 0.301029995#=7=#]
y = Float64[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

#a
s = Float64(0)
for i = 1 : length(x)
    s += x[i] * y[i]
end
println("a: $(s)")

#b
s = Float64(0)
for i in length(x):-1:1
    s += x[i] * y[i]
end
println("b: $(s)")

#c and d
partials = Float64[]
for i = 1 : length(x)
    push!(partials,x[i]*y[i])
end

sort!(partials, rev = true)
sc1 = Float64(0)
sd1 = Float64(0)
for i = 1:length(partials)
    if partials[i] > 0
        sc1 += partials[i]
    else
        sd1 += partials[i]
    end
end

sort!(partials)
sc2 = Float64(0)
sd2 = Float64(0)
for i = 1:length(partials)
    if partials[i] < 0
        sc2 += partials[i]
    else
        sd2 += partials[i]
    end
end

sc = Float64(sc1 + sc2)
sd = Float64(sd2 + sd1)
println("c: $(sc)")
println("d: $(sd)")
