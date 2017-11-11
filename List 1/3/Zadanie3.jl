#Miriam Jańczak 229761
#22.10.2017
#Program checks if numbers in floating point arithmetics are evenly distributed.

#Function prints a given number of succesive values
#in bit representation starting from given point
#delta - step by which numbers are incremented
#from - beggining of range
#steps - number of numbers to print
function stepforward(delta, from, steps)
    fl = Float64(from)
    for i = 1 : steps
        fl += delta
        println("$fl\t $(bits(fl))")
    end
end

#Function prints a given number of succesive values
#in reversed order in bit representation starting from given point
#delta - step by which numbers are decremented
#from - end of range
#steps - number of numbers to print
function stepbackward(delta, from, steps)
    fl = Float64(from)
    for i = 1 : steps
        fl -= delta
        println("$fl\t $(bits(fl))")
    end
end

qua = 4
stepforward(Float64(2.0^-52), 1, qua)
stepbackward(Float64(2.0^-52), 2, qua)

stepforward(Float64(2.0^-53), 0.5, qua)
stepbackward(Float64(2.0^-53), 1, qua)

stepforward(Float64(2.0^-51), 2, qua)
stepbackward(Float64(2.0^-51), 4, qua)

#=f = open("zad3.txt","w")
qua = 100

delta = Float64(2.0^-52)
write(f, "fl in [1,2]\t delta = 2^-52\n")
fl = Float64(1.0)
for i = 1 : qua
    fl += delta
    write(f,"$fl\t $(bits(fl))\n")
end

delta = Float64(2.0^-53)
write(f, "\n\nfl in [0.5,1]\t delta = 2^-53\n")
fl = Float64(0.5)
for i = 1 : qua
    fl += delta
    write(f,"$fl\t $(bits(fl))\n")
end

delta = Float64(2.0^-51)
write(f, "\n\nfl in [2,4]\t delta = 2^-51\n")
fl = Float64(2.0)
for i = 1 : qua
    fl += delta
    write(f,"$fl\t $(bits(fl))\n")
end

close(f)=#
