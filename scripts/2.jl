#= 
    - 使用 MLStyle 的 statements marco
    - @enum define card 
=#

include("../src/TexasHoldem.jl")
include("../src/utils.jl")

using MLStyle
using Combinatorics,StatsBase,DataFrames
using .TexasHoldem

#= @switch total_space[1:5] begin
    @case  nothing_cond(_)==true
        println("is nothing")
    
    end =#

    #= f = @λ begin
    # patterns here
    ((x,nothing_cond(x)) &&if nothing_cond(x)==true end)  => "is nothing"
    
    end =#

    #f(total_space[1],nothing_cond(total_space[1]))

    data=total_space[1]
    @match  data  begin
       if nothing_cond(data)==true end  => "is nothing"
        
    end


