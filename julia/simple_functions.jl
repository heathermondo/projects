# function to calculate the volume of a sphere
function volume_of_sphere(p, r)
    # Since Julia allows 'pi' and 'π', we should allow the user to specify it as an arg
    return 4/3*p*r^3
end

# functions can also be defined more succinctly
quadratic(a, sqr_term, b) = (-b + sqr_term) / 2a

# calculates x for 0 = a*x^2+b*x+c, arguments types can be defined in function definitions
function quadratic2(a::Float64, b::Float64, c::Float64)
    # unlike other languages 2a is equivalent to 2*a
    # a^2 is used instead of a**2 or pow(a,2)
    sqr_term = sqrt(b^2-4a*c)
    r1 = quadratic(a, sqr_term, b)
    r2 = quadratic(a, -sqr_term, b)
    # multiple values can be returned from a function using tuples
    # if the return keyword is omitted, the last term is returned
    r1, r2
end

using Test
@testset "volume_of_sphere tests" begin
@test volume_of_sphere(pi, 3) == 113.09733552923254
@test volume_of_sphere(π, 3) == 113.09733552923254
end

quad1, quad2 = quadratic2(2.0, -2.0, -12.0)
println("result 1: ", quad1)
println("result 2: ", quad2)
