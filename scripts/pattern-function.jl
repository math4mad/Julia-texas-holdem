#= 
随机选取五张牌判断其 type
=#

include("../src/TexasHoldem.jl")
using MLStyle
using Combinatorics,StatsBase,DataFrames,Random,Pipe
using .TexasHoldem

#import TexasHoldem:make_poker_face

total_space,total_size,_=TexasHoldem.texas_holdem



#show_hands()
faces=TexasHoldem.make_poker_face()
rand(faces,5)|>show_hands


