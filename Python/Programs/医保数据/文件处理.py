file=open("通话内容1.csv","r",encoding="gbk") #原文件“通话内容1.csv”为gbk编码
file1=open("通话内容.csv","w",encoding="utf-8")

Group=["单位","低保","居民","灵活就业","特困","未参保","学生","药店/医院","职工"]

line=file.readline()
file1.write(line) #每一行后面都有换行符，故不加
while True:
    line=file.readline()
    if not line: break
    temp=line.split(",")

    if temp[0] in Group:
        if temp[1][0:1]!=chr(34):
            file1.write(line)
        elif temp[1][0:1]==chr(34) and temp[1][-2:-1]==chr(34):
            file1.write(line[0:])

file.close()
file1.close()