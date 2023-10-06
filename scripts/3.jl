
include("../src/TexasHoldem.jl")

using MLStyle
using Combinatorics,StatsBase,DataFrames
using .TexasHoldem

res=total_space|>d->get_card_faces.(d)

function  royal_flush_cond2(arr::Tuple{Vector{Int64}, Vector{AbstractString}})::Bool
    
    bool_suits=Set(arr[2])|>length==1
    bool_nums=sort(arr[1])|>d->d==[10:14...]
    return bool_suits&&bool_nums
end

filter(x->royal_flush_cond2(x),res)
