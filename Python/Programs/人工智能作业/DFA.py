"""
输入：含多行主子符串的TXT文件
目标：预先给定某子字符串，将TXT中每行主字符串与之匹配（即子字符串是否存在于主字符串）
输出：若存在，输出主字符串所在行数

工具：有限自动机（DFA）
1.字母表 W = {a到z所有小写字母，A到Z所有大写字母，0到9所有数字所组成的字符对列表}
2.状态集 Q = {'00','01','10','11'}，其中第一个0/1表示子串内所有字符未全部匹配/已全部匹配；第二个0/1表示子串内某字符与主串对应字符不同/相同
3.初始状态 q = '00'
4.状态转移函数 f 表示子串是否全部匹配完（全部匹配为1，反之为0）以及主串与子串某字母是否相同（相同为1，反之为0）
5.终止状态（集）F = '11'
*6. 主串更新函数 f* 用于解决下面注意1中的问题

注意1：假设主串长度大于子串，则在匹配过程中难免出现子串前几个字符能匹配上，但中间某字符匹配不上，这个时候就要求主串回溯至第二个字符，重新开始匹配（暂不考虑KMP算法等字符串匹配思想）
注意2：若主串小于子串长度，此时可以确定子串与主串不匹配，直接退出
"""
class Str_Match:
    def __init__(self, main_string, sub_string):
        self.Main_string = main_string # 主字符串
        self.Sub_String = sub_string # 子字符串（指定字符串，不会改变）
        self.char_pair = [] # 字符对列表（字符对：分别取主字符串和子字符串中相应位置的一个字符），属于W的一个子集
        # self.states = ['00', '01', '10', '11'] # 状态集
        # self.init_state = '00' # 初始状态
        # self.stop_state = '11' # 终止状态

    def Char_pair_update(self): # 字符对列表更新函数
        self.char_pair = []
        length = len(self.Sub_String)
        for i in range(length):
            self.char_pair.append([self.Main_string[i],self.Sub_String[i]])

    def Match(self): # 有限自动机，从'00'开始，到'11'则结束，否则重新开始
        state = '00'
        length = len(self.Sub_String)
        for i in range(length):
            if i < length-1:
                if self.char_pair[i][0] == self.char_pair[i][1]:
                    state = '01'
                else:
                    state = '00'
            else:
                if self.char_pair[i][0] == self.char_pair[i][1]:
                    state = '11'
                else:
                    state = '10'
            if state in ['00','10']:
                return state
                break
        return state

    def Main_String_update(self, state): # 主子符串更新函数
        if state in ['00', '10']:
            self.Main_string = self.Main_string[1:]

    def Main(self): # 主函数
        while len(self.Main_string)>=len(self.Sub_String):
            self.Char_pair_update()
            state = self.Match()
            if state == '11': # 若状态为'11'，则说明匹配上，终止有限自动机的再运行
                return 1
                break
            else:
                self.Main_String_update(state)
        return 0


def Str_Find(document, sub_string): # 用于主子字符串匹配并输出对应行数
    rows = 0
    while True:
        main_string = document.readline().rstrip()
        if main_string == "": # 当读取至最后一行时，退出
            break
        rows = rows+1

        flag = Str_Match(main_string, sub_string).Main()
        if flag == 1:
            print(rows)