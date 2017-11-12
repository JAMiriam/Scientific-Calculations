# Miriam Jańczak 229761
# 12.11.2017
# Program calculates roots of Wilkinson's polynimial

using Polynomials

# Wilkinson's polynomial coefficients in natural form
# Uncomment value for second experiment
P = Float64[1, -210.0#=-2.0^(-23.0)=#, 20615.0,-1256850.0,
      53327946.0, -1672280820.0, 40171771630.0, -756111184500.0,
      11310276995381.0, -135585182899530.0,
      1307535010540395.0, -10142299865511450.0,
      63030812099294896.0, -311333643161390640.0,
      1206647803780373360.0, -3599979517947607200.0,
      8037811822645051776.0, -12870931245150988800.0,
      13803759753640704000.0, -8752948036761600000.0,
      2432902008176640000.0]

# Wilkinson's polynomial roots
p = Float64[1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0,
      14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0]

# to use Poly() is needed to reverse coefficients
P = P[end:-1:1]
# create polynomials using functions from Polynimials
P_Poly = Poly(P)
p_poly = poly(p)
# calculate roots of Wilkinson's polynomial
calculated_roots = roots(P_Poly)
println(calculated_roots,"\n")
calculated_roots = calculated_roots[end:-1:1]

# Prints values of polynomial calculated for calculated roots and error
for i = 1:length(calculated_roots)
      # &%.15f+%.15fi
      # @printf("%d&%.12e&%.12e&%.12e \\\\\n",i, #=real(calculated_roots[i]),
      # imag(calculated_roots[i]),=# abs(polyval(P_Poly,calculated_roots[i])),
      # abs(polyval(p_poly,calculated_roots[i])), abs(calculated_roots[i] - i))
    println("|P(z$(i))|:\t$(abs(polyval(P_Poly,calculated_roots[i])))")
    println("|p(z$(i))|:\t$(abs(polyval(p_poly,calculated_roots[i])))")
    println("|z$(i)-$(i)|: \t$(abs(calculated_roots[i] - i))\n")
end
