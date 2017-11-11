#Miriam Jańczak 229761
#22.10.2017
#Program calculates the smallest and the greatest number
#which fulfill the equation: x*(1/x) != 1 and pritn them to screen.

#Finding the smallest number
x = nextfloat(Float64(1.0))
while Float64(x*(Float64(1.0)/x)) == Float64(1.0) && x < Float64(2.0)
    x = nextfloat(x)
end
println("The smallest x which fulfill the equation is: $(x)")

#Finding the greatest number
x = prevfloat(Float64(2.0))
while Float64(x*(Float64(1.0)/x)) == Float64(1.0) && x > Float64(1.0)
    x = prevfloat(x)
end
println("The largest x which fulfill the equation is: $(x)")
