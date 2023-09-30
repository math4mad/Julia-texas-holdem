#= 
  全部条件已经修正, 测试全部通过
=#
using .TexasHoldem
using Test

include("../src/TexasHoldem.jl")
include("../src/utils.jl")
using .TexasHoldem
using Test
total_space,total_size=texa_holdm

"""
    holdem_test()

    texas hold'em  hands  probability
    test    
"""
function  holdem_test()
   @testset "hold'em condition test" begin
        @test royal_flush|>length==4
        @test straight_flush|>length==36  
        @test four_kind|>length==624
        @test full_house|>length==3744
        @test flush|>length==5108
        @test straight|>length==102_00
        @test three_kind|>length==549_12
        @test two_pairs|>length==123_552
        @test one_pairs|>length==109_824_0
        @test nothing_hands|>length==130_254_0

    end;
end

royal_flush=filter(x->royal_flush_cond(x),total_space)
royal_straight_flush=filter(x->straight_flush_cond(x),total_space)
straight_flush=setdiff(royal_straight_flush,royal_flush)
four_kind=filter(x->four_kind_cond(x),total_space)
full_house=filter(x->full_house_cond(x),total_space)
flush=filter(x->flush_cond(x),total_space)
straight=filter(x->straight_cond(x),total_space)
setdiff!(straight,royal_straight_flush)
three_kind=filter(x->three_kind_cond(x),total_space)
two_pairs=filter(x->two_pairs_cond(x),total_space)
one_pairs=filter(x->one_pairs_cond(x),total_space)
nothing_hands=filter(x->nothing_cond(x),total_space)
holdem_test()


