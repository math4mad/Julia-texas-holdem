using Combinatorics

# 1. define poker  total space 
function make_poker_face()
    suits::AbstractString=["♥️","♠️","♦️","♣️"]
    digits::Int=Vector(2:14) # for 2:10,J,Q,K,A
    "52 张牌的牌面"
     return poker_face::Vector{AbstractString,Int}=[[color,num] for color in suits,num in digits]|>vec
end
poker_face=make_poker_face()

"全样本空间 2,598,960中组合 "
total_space=combinations(poker_face,5)|>collect

"全样本空间容量=> 2,598,960"
total_size=length(total_space)



#ns_tuple_array=total_space|>d->get_card_faces.(d)

"""
德州扑克的全概率空间和样本容量

- `total_spce` 全概率空间 ::Array
- `total_size` 全概率空间容量: Number
-  `ns_tuple_array`  num,suit 分离处理的 tuple
"""
texas_holdem=(total_space,total_size,0)

#combinations(1:52,2)|>collect


#total_space2=combinations(poker_face,2)|>collect


