import os
file_path = os.listdir('Thesis/ETM-市长电话文本数据/原始市话数据') # 原始数据所在目录

T1 = ['环境保护','市政设施','自然资源','交通运输','社会管理','公共服务','城乡建设']
T2 = [['公共事业','供水'],['市容管理','环境卫生'],['社会福利','建设改造']]
Sandstorm = ['风沙','尘暴', '沙暴', '尘沙', '沙尘', '沙漠化', '灰尘', '扬尘', '尘土', '泥雨', '泥点', '极端天气', '恶劣天气', '下泥']

with open('Thesis/ETM-市长电话文本数据/data/sandstorm.txt','w', encoding='utf-8') as F: # 提取数据保存路径
    for i in range(len(file_path)):
        # year_ = file_path[i][-11:-7]
        # if year_=='2022':
        f = open('Thesis/ETM-市长电话文本数据/原始市话数据/'+file_path[i],'r',encoding='utf-8') # 原始数据所在目录
        title = f.readline()
        while True:
            line = f.readline().rstrip()
            if not line:
                break
            line = line.split('\t')
            try:
                for i in range(len(Sandstorm)):
                    if Sandstorm[i] in line[11]:
                        F.write(line[3]+'\t'+line[4]+'\t'+line[5]+'\t'+line[6]+'\t'+line[11]+"\n")
                        break
            except:
                pass