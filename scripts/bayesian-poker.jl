#= 
  bayesian simulation of poker
=#

include("../src/TexasHoldem.jl")
using MLStyle
using Combinatorics,StatsBase,DataFrames,Random,Pipe
using .TexasHoldem
using Turing
Random.seed!(343434)
cards=TexasHoldem.make_poker_face()|>Set


## 1.  首先构建发的牌和 board 里的牌(boards, turn, river), 分别是是2张, 3张,1张,1张

sending_cards=rand(cards,13)
self_hands,board,turn,river,other_player=(sending_cards[1:2],sending_cards[3:5],sending_cards[6],sending_cards[7],sending_cards[8:13])

## 2.  减掉抽出的牌
setdiff!(cards,sending_cards|>Set)


## 3. 显示发到你手中的牌,和 board 牌
@info "your hands"=>self_hands
@info "board carnd"=>board

##  4. 显示手牌和 board 牌组合的类型>TexasHo
[self_hands,board]


