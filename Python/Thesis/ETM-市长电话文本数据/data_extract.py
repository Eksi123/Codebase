import os
file_path = os.listdir('c:\\Users\\XGQ\\Desktop\\Programs\\Python\\Python程序\\Thesis\\ETM-市长电话文本数据\\原始市话数据')

for year in range(2005,2023):
    f = open("data/"+str(year)+'.txt', 'a', encoding='utf-8')
    for i in range(len(file_path)):
        year_ = file_path[i][-11:-7]
        if year_==str(year):
            with open('原始市话数据/'+file_path[i], 'r', encoding='utf-8') as file: 
                title = file.readline()
                while True:
                    line = file.readline().rstrip()
                    if not line:
                        break
                    line = line.split('\t')
                    try:
                        if int(line[1][:4])==year and line[3]=='行政服务' and line[4]  in ['服务态度与质量','工作效率'] and line[11]:
                            f.write(line[11]+"\n")
                    except:
                        pass
    f.close()