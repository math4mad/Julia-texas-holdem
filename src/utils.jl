using Combinatorics

# 1. define poker  total space 
suits=["♥️","♠️","♦️","♣️"]
digits=Vector(2:14) # for 2:10,J,Q,K,A


"52 张牌的牌面"
poker_face=[[color,num] for color in suits,num in digits]|>vec

"全样本空间 2,598,960中组合 "
total_space=combinations(poker_face,5)|>collect

"全样本空间容量=> 2,598,960"
total_size=length(total_space)

"""
德州扑克的全概率空间和样本容量

- `total_spce` 全概率空间 ::Array
- `total_size` 全概率空间容量: Number
"""
texa_holdm=(total_space,total_size)

#combinations(1:52,2)|>collect


total_space2=combinations(poker_face,2)|>collect


