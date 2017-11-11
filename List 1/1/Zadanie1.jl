#Miriam Jańczak 229761
#22.10.2017
#Program calculates values of macheps, eta and max for different arithmetics from IEEE 754.

#Function which calculates macheps for given type
#t - type, can be Float16, Float32 or Float64
function macheps(t)
    meps::t = t(1.0)
    while t(1.0) + meps/t(2.0) > t(1.0)
        meps /= t(2.0)
    end
    return meps
end

#Function which calculates eta for given type
#t - type, can be Float16, Float32 or Float64
function fleta(t)
    eta::t = t(1.0)
    while eta/t(2.0) > t(0.0)
        eta /= t(2.0)
    end
    return eta
end

#Function which calculates max for given type
#t - type, can be Float16, Float32 or Float64
function flmax(t)
    max::t = t(1.0)
    while !isinf(max*t(2.0))
        max *= t(2.0)
    end
    max*=(t(2.0)-t(macheps(t)))
    return max
end

#Printing calculated values
for t in [Float16, Float32, Float64]
    @printf("Calculated macheps for %s: %.20e\n",t, macheps(t))
    @printf("Function   macheps for %s: %.20e\n\n",t, eps(t))

    @printf("Calculated eta for %s: %.20e\n",t, fleta(t))
    @printf("Function   eta for %s: %.20e\n\n",t, nextfloat(t(0.0)))

    @printf("Calculated max for %s: %.20e\n",t, flmax(t))
    @printf("Function   max for %s: %.20e\n\n",t, realmax(t))
end
