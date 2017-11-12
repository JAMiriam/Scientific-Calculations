# Miriam Jańczak 229761
# 12.11.2017
# Program calculates limit when x approaches infinity and draw plot
# of the function given in exercise

using SymPy
using Plots
plotly()
T = Float64     # type

# Function given in the exercise with dynamic type to draw plots
fun(x) = (T(T(exp(x))*(T(log(T(1) + T(exp(-x)))))))
# Theoretical function to calculate limit
fun_no_type(x) = (exp(x)*(log(1 + exp(-x))))
x = symbols("x")
plt = plot(fun, -10, 50,legend=false)
display(plt)
println("Limit: ",limit(fun_no_type(x), x => oo))
