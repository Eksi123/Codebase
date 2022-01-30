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

# （3）散列结构：如字典（散列表）


#----------------------------------------------------#

# 逻辑结构

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
