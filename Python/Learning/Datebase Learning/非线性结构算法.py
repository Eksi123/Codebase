# 二叉搜索树（二叉查找树/二叉排序树）
"""
已知有序列表的二分查找法时间复杂度低(O(logn))，但对于普通的插入删除操作来说时间复杂度高(O(n))；链表的插入删除操作时间复杂度低，
(O(1))，但查找时间复杂度低(O(n))。鉴于此，我们综合有序列表和链表的优点，创造出二叉搜索树/二叉查找树，平均情况下，无论对于查找
操作，(O(logn))还是插入删除操作，(O(logn))其平均时间复杂度都比较低。特别地，当二叉搜索树为平衡树时，最糟糕时间复杂度为(O(logn))

二叉搜索树首先是二叉树结构，但它有其自身特性：对于二叉搜索树的任一非空左子树，其所有节点值均小于该左子树的父结点值，
同理对于任一非空右子树，其所有节点值均大于该右子树的父结点值。不难发现，二叉搜索树中是不允许相同节点值同时存在的，所以
某种意义上，二叉搜索树的节点可用于保存键值对，只对其键进行二叉搜索，本文为简化，故不讨论键。
"""
class Binary_Search_Tree: # 二叉搜索树
    def __init__(self, rootnode):
        self.rootnode=rootnode # 根节点
        self.left_tree=None
        self.right_tree=None
    
    def find(self, data): # 查找某一结点值是否存在
        if self.rootnode==data: 
            return True
        else:
            if self.rootnode>data and self.left_tree:
                return self.left_tree.find(data)
            elif self.rootnode<data and self.right_tree:
                return self.right_tree.find(data)
            else:
                return None

    def find_min(self): # 查找当前节点所对应二叉搜索树的最小节点值（易知其一定位于叶子节点上）
        if self.left_tree:
            return self.left_tree.find_min()
        else:
            return self.rootnode
    
    def find_max(self): # 查找当前节点所对应二叉搜索树的最大节点值
        if self.right_tree:
            return self.right_tree.find_max()
        else:
            return self.rootnode

    def add_tree(self, newnode): # 遵循规则插入新的子树（该插入方法通俗易懂，但会做重复查找操作，故时间复杂度较高）
        if not self.find(newnode):
            if newnode<self.rootnode:
                if self.left_tree:
                    return self.left_tree.add_tree(newnode)
                else:
                    tree=Binary_Search_Tree(newnode)
                    self.left_tree=tree
            else:
                if self.right_tree:
                    return self.right_tree.add_tree(newnode)
                else:
                    tree=Binary_Search_Tree(newnode)
                    self.right_tree=tree

    def del_tree(self,data): # 仅删除该节点值所对应的节点，并保持二叉搜索树的特性
        if self.find(data):
            if self.rootnode<data:
                self.right_tree=self.right_tree.del_tree(data)
            elif self.rootnode>data:
                self.left_tree=self.left_tree.del_tree(data)
            else: # 若找到了对应值的节点，下面进行删除操作
                if self.left_tree and self.right_tree: # 若左子树和右子树均存在
                    min_node=self.right_tree.find_min()
                    self.rootnode=min_node # 取右子树中最小节点值来替代当前节点
                    self.right_tree=self.right_tree.del_tree(min_node) # 删除替代前的右子树的最小节点
                    return self
                else: # 若左子树和右子树不全存在
                    if self.left_tree:
                        return self.left_tree
                    else:
                        return self.right_tree

    def travel(self): # 采用先序遍历方法
        if self.rootnode:
            print(self.rootnode, end=" ")
            if self.left_tree:
                self.left_tree.travel()
            if self.right_tree:
                self.right_tree.travel()

Tree=Binary_Search_Tree(7)
Tree.add_tree(5)
Tree.add_tree(8)
Tree.add_tree(4)
Tree.add_tree(6)
Tree.add_tree(3)
Tree.travel()
"""
二叉搜索树结构如下：
                    7
                   / \
                  5   8
                 / \
                4   6
               /
              3
遍历结构如下：7 5 4 3 6 8 
"""


# 图的最短路径