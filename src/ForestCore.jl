module ForestCore

using DataFrames, IrrationalConstants, Unitful

import Unitful: Length, Area, Volume, Mass, Units, Quantity

const ImperialUnits = Union{typeof(u"inch"), typeof(u"ft"), typeof(u"yd"), typeof(u"mi")}

export @u_str, unit, ustrip, uconvert, Length, Area, Volume, Mass, ImperialUnits

include("utils.jl")

export basalarea, removeunits, restoreunits, referencearea, expansionfactor

end
