#Miriam Jańczak 229761
#22.10.2017
#Program calculates approximated derivative of the given function f, absolute error of calculations
#and value of expression h+1, where h = 2^-(n) (n = 0, 1, 2, . . . , 54) and save results to file.

#Definition of function f
fun(x) = sin(x) + cos(3x)

#Formula of derivative of function f
fun_derivative(x) = cos(x) - 3sin(3x)

#Derivative approximation formula
#fun - function
#x - argument of function
#h - very small factor
approximated_derivative(fun, x, h) = (fun(x+h)-fun(x))/h

#Absolute error formula
approximation_error(real_val, approximated_val) = abs(real_val - approximated_val)

fle = open("zad7.txt","w")
for i = 0 : 54
    h = Float64(2.0)^(-i)
    rv = fun_derivative(Float64(1.0))
    av = approximated_derivative(fun, Float64(1.0), h)
    err = approximation_error(rv, av)
    write(fle,"h = 2^-$(i)\tAppr: $(av)\tReal: $(rv)\tErr: $(err)\t 1+h = $(1+h)\n")
end
close(fle)
