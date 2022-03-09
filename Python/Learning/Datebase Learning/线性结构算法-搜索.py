# 搜索：python的内置搜索函数in和find，其底层算法为遍历搜索（用于列表，元组等）+散列表搜索（用于字典）

# （1）遍历搜索
A1=[1,5,8,5,3,9,43,2,12,45,64,23]; item=13
def find_11(List,item): # 无序列表搜索
    flag=False; length=len(List)
    for i in range(length):
        if List[i]==item:
            flag=True
            break
    return flag
print(find_11(A1,item))

# 平均时间复杂度：目标元素在列表中O(n/2)、目标元素不在列表中O(n)

A2=[1,2,3,5,5,8,9,12,23,43,45,64]; item=13
def find_12(List,item): # 有序列表搜索
    flag=False; sp=0
    while List[sp]<=item:
        if List[sp]==item:
            flag=True
            break
        else:
            sp=sp+1
    return flag
print(find_12(A2,item))

# 平均时间复杂度：目标元素在列表中O(n/2)、目标元素不在列表中O(n/2)

# （2）有序列表二分搜索
A2=[1,2,3,5,5,8,9,12,23,43,45,64]; item=13

def find_21(List,item): # 非递归
    flag=False; first=0; last=len(List)-1
    while first<=last and flag==False:
        mid=(first+last)//2  # 模运算
        if List[mid]==item:
            flag=True
        else:
            if List[mid]<item:
                first=first+1
            else:
                last=last-1
    return flag
print(find_21(A2,item))

def find_22(List,item): # 递归
    if len(List)==0:
        return False # 终止条件1
    else:
        mid=len(List)//2
        if List[mid]==item:
            return True # 终止条件2
        else:
            if List[mid]<item:
                return find_22(List[mid+1:],item)
            else:
                return find_22(List[:mid],item)
print(find_22(A2,item))

# 时间复杂度：O(log(n))

# （3）散列表搜索/字典检索
A3={"1":0, "5":0, "8":0, "5":0, "3":0, "9":0, "43":0, "2":0, "12":0, "45":0, "64":0, "23":0}
item=13
def find_3(List,item):
    if str(item) in List:
        print(True)
    else:
        print(False)
find_3(A3,item)

# 时间复杂度O(1)


# 扩展：KMP字符串匹配（搜索）算法（待更新）
"""
现有字符串： STR="acabaabaabcacaabc"     str="abaabcac" 
现在我们需要判定字符串str是否在STR中出现，即在STR中搜索str，这就需要用到KMP字符串匹配算法，其思路如下：

通常，我们会采用逐字符比对的方法：即从str的首字符"a"开始，若STR中某一位置的字符也是"a",则继续比对下一个，直到str中所有字符比对完成，我们就说str存在于STR中。反之，若比对过程中哪一个
对不上，则str需要从头开始比对。

可以看到，这种暴力比对方法虽然简单直观，但问题在于：
"""
class Solution:
    # 获取next数组
    def get_next(self, T):
        i = 0
        j = -1
        next_val = [-1] * len(T)
        while i < len(T)-1:
            if j == -1 or T[i] == T[j]:
                i += 1
                j += 1
                # next_val[i] = j
                if i < len(T) and T[i] != T[j]:
                    next_val[i] = j
                else:
                    next_val[i] = next_val[j]
            else:
                j = next_val[j]
        return next_val

    # KMP算法
    def kmp(self, S, T):
        i = 0
        j = 0
        next = self.get_next(T)
        while i < len(S) and j < len(T):
            if j == -1 or S[i] == T[j]:
                i += 1
                j += 1
            else:
                j = next[j]
        if j == len(T):
            return i - j
        else:
            return -1



STR = 'acabaabaabcacaabc' # 主字符串
str = 'abaabcac' # 待匹配字符串
solution = Solution()
solution.kmp(STR, str) # 输出匹配后的起始位置


9787111652090