#= 
    - 使用 MLStyle 的 statements marco
    - @enum define card 
=#


using MLStyle
using Combinatorics,StatsBase,DataFrames

@kwdef struct Suit 
club::String = "♣"
diamond::String  = "♦" 
heart::String = "♥" 
spades::String= "♠"
end
@kwdef struct Rank 
    two::Int = 2
    three::Int = 3
    four ::Int= 4
    five ::Int= 5
    six ::Int= 6
    seven::Int = 7
    eight::Int = 8
    nine ::Int= 9
    ten ::Int= 10
    jack::Int = 11
    queen::Int = 12
    king ::Int= 13
    ace ::Int= 14
end
struct  Card
    rank::Rank
    suit::Suit
end

#card1=Card(three,♥)
arr1=[two ,three, four, five, six, seven, eight, nine, ten ,jack ,queen, king,ace]
arr2=[♣, ♦, ♥ ,♠]
poker_faces::Vector{Card}=[Card(r,s) for r in arr1,s in arr2]|>vec

total_space=combinations(poker_faces,5)|>collect

# function get_card_faces(cards::Vector{Card})::Tuple{Vector{Int},Vector{any}}
#     ranks=Vector{Int}(undef, 5)
#     suits=Vector{any}(undef, 5)
#     for idx in eachindex(cards)
#         ranks[idx]=Int(cards[idx].rank)
#         suits[idx]=String(cards[idx].suit)
#     end  
#     return (ranks,suits)
# end


# function  royal_flush_cond(cards::Vector{Card})::Bool
#     ranks,suits=get_card_faces(cards)  
#     bool_suits=Set(suits)|>length==1
#     bool_ranks=sort(ranks)|>d->d==[10:14...]
#     return bool_suits&&bool_ranks
# end

#filter(x->royal_flush_cond(x),total_space)

total_space