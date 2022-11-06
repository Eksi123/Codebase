from  DFA import Str_Find# 调用Str_Match 类

if __name__ == '__main__':
    file = open("strings.txt","r",encoding="utf-8") # 读取外部文件
    Str_Find(file, 'acd') # 输入主字符串txt文件，以及指定子字符串。输出匹配后行数