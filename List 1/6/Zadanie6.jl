#Miriam Jańczak 229761
#22.10.2017
#Program calculatest values of two exact, but differently represented functions f and g
#and save output to file. As argument of functions f and g
#program takes value x = 8^(-i), where i = 1, 2, 3, ... n

fl = open("zad6.txt","w")
n = 200
for i = 1 : n
    x = Float64(8)^(-i)
    f = sqrt(x^2+1)-1
    g = x^2/(sqrt(x^2+1)+1)
    write(fl,"x = 8^-$(i)\t f(x) = $(f)\t g(x) = $(g)\n")
end
close(fl)
