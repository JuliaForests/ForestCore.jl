"""
    basalarea(d::Length)

calculates the individual cross-sectional area (g) of a tree stem.

# arguments
- `d`: diameter at breast height as a unitful quantity e.g. 10u"cm" or 12u"inch". The diameter must be a positive value.

# returns
- `Quantity`: area in square feet ft2 if input is imperial or square meters m2 otherwise.

# mathematical basis
the calculation uses the standard geometric formula
```math
g = \\frac{\\pi d^2}{4}
```

# accuracy note

most stems are not perfectly circular
using a diameter tape slightly overestimates the true area because the circle
is the geometric figure with the smallest perimeter for a given area.

# examples

```julia-repl
julia> basalarea(30u"cm")
0.07068583470577035 m^2

julia> basalarea(11.8u"inch")
0.7594363907740327 ft^2
```
"""
function basalarea(d::Length)
  ustrip(d) <= 0 && throw(DomainError("The diameter must be a positive value, observed values is $d"))

  g = quartπ * abs2(d)

  if unit(d) isa ImperialUnits
    return uconvert(u"ft^2", g)
  else
    return uconvert(u"m^2", g)
  end
end
