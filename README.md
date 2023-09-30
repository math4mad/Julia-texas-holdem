## 定义了德州扑克的各手牌的概率空间
## 定义了各手牌的概率空间



```julia
"""
    get_card_faces(arr::Array)::Tuple{Vector{Int},Vector{AbstractString}}
    
    从数组获得牌面的点数和suits
"""
function get_card_faces(arr::Array)::Tuple{Vector{Int},Vector{AbstractString}}
    nums=Vector{Int}(undef, 5)
    suits=Vector{AbstractString}(undef, 5)
    for idx in eachindex(arr)
        nums[idx]=arr[idx][2]
        suits[idx]=arr[idx][1]
    end  
    return (nums,suits)
end
```

### 1. royal_flush_cond
```julia
    """
                royal_flush_cond(arr::Array)::Bool
                皇家 flush 的条件
                
                同一 suit
                从小到大排列为:[10,11,12,13,14] 
                for  10,J,Q,K,A
                sort(nums)==10:1:14
    """
    function  royal_flush_cond(arr::Array)::Bool
        nums,suits=get_card_faces(arr)  
        bool_suits=Set(suits)|>length==1
        bool_nums=sort(nums)|>d->d==[10:14...]
        return bool_suits&&bool_nums
    end
```


### 2. straight_flush_cond
```julia
    """
    straight_flush_cond(arr::Array)

    [A,2,3,4,5],即 [2,3,4,5,14]的牌需要注意,也是flush
    """
    function straight_flush_cond(arr::Array)
        nums,suits=get_card_faces(arr)
        bool_suits = Set(suits) |> length == 1
        sort!(nums)    #[1,2,3,4,5]
        bool_nums = nums == Vector(nums[1]:1:nums[end])||(nums==[2:5...,14])
        return bool_suits&& bool_nums
    end
```
   ###  3. four_kind_cond
```julia
    "Four of a Kind  四张同点数, 一张不同"
    function four_kind_cond(arr::Array)::Bool
        nums,_=get_card_faces(arr)  
        elems=Set(nums)|>collect
        res=false
        if length(elems)==2
            r1=count(i->(i==elems[1]), nums)
            r2=count(i->(i==elems[2]), nums)
            res=r1==4||r2==4
        end
        return res

    end
```
### 4. full_house_cond
```julia
    """
    五张牌, 三张点数一样, 两张点数一样
    """
    function  full_house_cond(arr::Array)::Bool
        nums,_=get_card_faces(arr)    
        
        lev=counts(nums)|>d->sort!(d;rev=true) #按频数逆序排列
        return (lev[1]==3)&&(lev[2]==2)
    end

```
### 5.  flush_cond
```julia
    """
        flush_cond(arr::Array)

        flush 条件

        五张牌点数不同
        需要过滤掉连牌包括[A,2,3,4,5],即 [2,3,4,5,14]

        花色为 1
        `bool_suits=Set(suits)|>length==1`
        
    """
    function flush_cond(arr::Array)
        
            nums,suits=get_card_faces(arr)
            bool_suits=Set(suits)|>length==1
            sort!(nums)    #[5,4,3,2,1]
            bool_nums =nums == Vector(nums[1]:1:nums[end])||(nums==[2:5...,14])
            return (!bool_nums)&&bool_suits
    end
```

### 6. straight_cond
```julia
    """
        straight_cond(arr::Array)::Bool

        不限制花色,但是需要连牌包括[A,2,3,4,5],即 [2,3,4,5,14]
    """
    function straight_cond(arr::Array)::Bool
            nums,_=get_card_faces(arr)  
            bool_nums=nums==Vector(nums[1]:1:nums[end])||(nums==[2:5...,14])
            return bool_nums
    end
```

### 7. three_kind_cond

```julia
"three of a Kind  3张同点数, 2张不同"
function three_kind_cond(arr::Array)
    nums,_=get_card_faces(arr)  
    lev= counts(nums)|>d->sort!(d;rev=true)
    return  (lev[1]==3)&&(lev[2]==1)&&(lev[3]==1)
end
```

### 8. two-pairs

```julia
    function two_pairs_cond(arr::Array)::Bool
        nums,_=get_card_faces(arr)  
        lev= counts(nums)|>d->sort!(d;rev=true)
        return  (lev[1]==2)&&(lev[2]==2)&&(lev[3]==1)
    end
```


### 9.  one-pairs
```julia
    function one_pairs_cond(arr::Array)
        nums,_=get_card_faces(arr)  
        #lev= counts(nums)|>d->sort!(d;rev=true)
        len=levels(nums)|>length
        #return  (lev[1]==2)&&(lev[2]==1)&&(lev[3]==1)&&(lev[4]==1)
        return len==4
        

    end
```


### 10. nothing_cond
```julia
    function nothing_cond(arr::Array)
        nums,suits=get_card_faces(arr) 
        sort!(nums) 
        suit_len=levels(suits)|>length
        num_len=levels(nums)|>length
        return (suit_len>1)&&(num_len==5)&&(nums≠([nums[1]:nums[end]...])&&(nums≠[2:5...,14]))
    end
```


