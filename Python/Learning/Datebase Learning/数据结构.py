# 物理结构（存储结构）

# （1）顺序结构：如常见的列表
# （2）链式结构：如单向链表，如下：

# 定义节点（元素）类
class Node:
    def __init__(self,data,next=None):
        self.data=data
        self.next=next

# 定义链表类
class LinkList:
    def __init__(self):
        self.head=None        # 头指针
    
    def len(self):            # 求链表长度
        cur=self.head; length=0
        while cur!=None:
            length=length+1
            cur=cur.next
        return length

    def printf(self):            # 遍历链表
        node=A.head
        for i in range(A.len()):     
            print(node.data)
            node=node.next

    def append(self,data):   # 在链表末尾添加节点
        node=Node(data)
        if self.len()==0:
            self.head=node
        else:
            cur=self.head
            pre=None
            while cur!=None:
                pre=cur
                cur=cur.next
            pre.next=node

    def insert(self,sp,data):  # 在指定位置插入新节点
        node=Node(data)
        if sp<=0:
            node.next=self.head
            self.head=node
        elif sp>=self.len():
            self.append(data)
        else:
            cur=self.head
            for i in range(sp-1):
                cur=cur.next
            node.next=cur.next
            cur.next=node

    def pop(self,sp=None):     # 删除指定位置的节点（若sp不填，则默认删除末尾节点）
        if sp==None:
            if self.len()>1:
                cur=self.head
                pre=None
                length=self.len()
                for i in range(length-1):
                    pre=cur
                    cur=cur.next 
                pre.next=None    
            else:
                self.head=None
        else:
            if self.len()-1<=sp:
                self.pop()
            else:
                cur=self.head
                pre=None
                for i in range(sp):
                    pre=cur
                    cur=cur.next
                pre.next=cur.next
                cur.next=None    
    
    def insert_1(node,data):   # 在指点节点node后插入一个新节点
        newnode=Node(data)
        node1=node.next
        node.next=newnode
        newnode.next=node1

    def pop_1(node):          # 删除指定节点node后的那个节点
        node1=node.next
        node2=node1.next
        node.next=node2
        node1.next=None

    def found(self,data): # 判断链表中是否含有数据data的节点，有就返回True
        cur=self.head
        while cur!=None:
            if cur.data==data:
                return True
            cur=cur.next
        return False


A=LinkList()         # 创建链表
for i in range(5):
    A.append(i)

0 1 2 3 4

A.insert(2,7)        # 在第三个节点的位置插入新节点（数据为7）

0 1 7 2 3 4

A.pop(1)             # 删除第二个节点

0 7 2 3 4

A.printf()           # 遍历并输出链表各节点数据
print(A.len())       # 输出链表长度

5

print(A.found(6))    # 判断链表内是否含有某节点数据为6

False

# （3）散列结构：如散列表/哈希表，又说字典，其存储原理简单模拟如下,实际运用时无需定义：
class HashTable:
    def __init__(self,size):
        self.size=size # 自定义散列表/哈希表长度，真实的哈希表长度可动态调整
        self.keys=[None]*self.size # 存放键key
        self.values=[None]*self.size # 存放值value
    
    def printf(self):
        length=len(self.keys)
        for i in range(length):
            if self.keys[i]!=None:
                print(self.keys[i]+":"+str(self.values[i]))

    def Hash_Function(self,key): # 散列函数/哈希函数
        sum=0; length=len(key)
        for i in range(length): # 求取字符串各字符Unicode值之和
            sum=sum+ord(key[i])
        hash=sum%self.size # 散列函数-取余函数，返回哈希值
        return hash

    def Rehash(self,hash):
        new_hash=(hash+1)%self.size # 重新求哈希值
        return new_hash

    def set(self,key,value): # 可实现添加，修改，删除键值对的功能
        hash=self.Hash_Function(key)
        if self.keys[hash]==None: # 如果哈希值对应键为空，则添加该键值对
            self.keys[hash]=key
            self.values[hash]=value
        else:
            if self.keys[hash]==key: # 如果哈希值对应键不为空，且和输入键相同，则修改该键对应的值
                if value==None:
                    self.keys[hash]=None # 上述情况下，如果输入值为空，则删除该键值对
                else:
                    self.values[hash]=value
            else:  # 哈希值对应键不为空，但与输入键不同，此时重新求哈希值，直到满足上述两种情况任一种
                new_hash=self.Rehash(hash)
                while self.keys[new_hash]!=None and self.keys[new_hash]!=key:
                    new_hash=self.Rehash(new_hash)
                
                if self.keys[new_hash]==None: # 重复上述操作
                    self.keys[new_hash]=key
                    self.values[new_hash]=value
                else:
                    if self.keys[new_hash]==key: 
                        if value==None:
                            self.keys[new_hash]=None 
                        else:
                            self.values[new_hash]=value

    def get(self,key): # 输入键，索引值
        hash=self.Hash_Function(key)
        if self.keys[hash]==None: # 如果该键不存在，返回空值
            return None
        else:
            if self.keys[hash]==key:
                return self.values[hash]
            else:
                new_hash=self.Rehash(hash) # 操作类似get函数，不断刷新哈希值来检索
                while self.keys[new_hash]!=key :
                    new_hash=self.Rehash(new_hash)
                if new_hash!=hash:
                    return self.values[new_hash]
                else:
                    return None

A=HashTable(5)
A.set("a",2); A.set("b",4); A.set("c",8)
A.printf()
a:2
b:4
c:8

A.set("a",1)
A.printf()
a:1
b:4
c:8

A.set("c",None)
A.printf()
a:1
b:4

A.get("a")
1


#----------------------------------------------------#

# 逻辑结构（可由上述物理结构组成）

# （1）无序集合，如字典
A={"a":1,"b":2,"c":3}
A["d"]=4; print(A) # 进入字典
del A["d"]; print(A)  # 移出字典

#（2）线性表，如列表，栈，队列
#（2.1）列表（可在任意位置进入或退出）
A=[1,2,3]
A.insert(2,4); print(A)
A.pop(2); print(A)
# （2.2）栈（先进后出，后进先出）
A=[1,2,3]
A.append(4); print(A) #顶部入栈
A.pop(); print(A) #顶部出栈
A.insert(0,4); print(A) #底部入栈
A.pop(0); print(A) #底部出栈
# （2.3）队列（先进先出，后进后出）
A=[1,2,3] 
A.append(4); print(A) #入列（自右向左）
A.pop(0); print(A) #出列
A.insert(0,4); print(A) #入列（自左向右）
A.pop(); print(A) #出列
# （2.4）双端队列（进出方向不限）
A=[1,2,3]
A.append(4); print(A) #入列
A.pop() #出列（先进先出）
print(A) 
A.pop(0) #出列（先进后出）
print(A) 

# （3）非线性表，如树，图
