from SA import TSP # 调用Str_Find函数

if __name__ == '__main__':
    """
    1 考虑到样例数据中存在空格和Tab键分割两种txt文件，因此需区分分隔符sep，还请老师调用TSP函数时注意
    2 如果存在对其他路径下txt文件的调用，在txt文件名前面注明路径，即"path_name/file_name"
    """
    TSP(file_name, sep) # 输入txt文件名和文件分隔符，输出最优解和求解过程
