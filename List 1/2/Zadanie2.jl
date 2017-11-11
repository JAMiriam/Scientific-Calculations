#Miriam Jańczak 229761
#22.10.2017
#Program calculates Kahan's machine epsilon for different types of float.

#Function which calculates Kahan's macheps for given type
#t - type, can be Float16, Float32 or Float64
function kahanseps(t)
    keps::t = t(3.0)*(t(4.0)/t(3.0) - t(1.0)) - t(1.0)
    return keps
end

#Printing calculated values
for t in [Float16, Float32, Float64]
    println("Calculated Kahan's eps for $(t): $(kahanseps(t))")
    println("      Function macheps for $(t): $(eps(t))\n")
end
