--[=[ ʵ���һ�����V2.8, ������, ����ʦ����ѧ��ѧ��ͳ��ѧԺ, Ӧ��ͳ�ƽ������ص�ʵ����. 2018-05-02
	Bin8(num,ch)                       -- ��num���ն�����8λ��ʾ
	Bin16(num,ch)                      -- ��num���ն�����16λ��ʾ
	BLSave(...)                        -- �����洢��, ��һϵ�б����洢������, �������Դ洢���ⲿ�ļ���
	BLLoad(Biao)                       -- �������洢���е���Ϣת����һϵ�б�������
	BLView(Biao)                       -- ��ʾ�������ݼ���������ϵ
	ConCat(tt,ch)                      -- ��ƴ�Ӻ���,������ֱΪ�ַ���
	ConCatKey(tt,ch)                   -- �ֵ�ƴ�Ӻ���,���ֵ���ֱΪ�ַ���,���޵�ǰ��, ���ص���һ���ַ���.
	Cpu(str)                           -- ��ʾ�Ѿ����е�CPUʱ��,strΪ��ʾ��Ϣ
		*Cpu_Time=os.clock()           -- ϵͳԤ����ı���, �Ѿ�������
	GetStrKey(tt)                      -- ����ֵ������ַ���, ���ش�С�������������,���޵�ǰ��
	DelHtml(ss)                        -- ɾ��HTML�е�<>�ڵĸ��ֿ�������
	Find(ss,chs)                       -- ���Һ���
	FileName(sFile)                    -- �����ļ�������չ��
	Int(aa)                            -- ȡ������, �������������������, (1.2)=1, (1.7)=1, (-1.2)=-2, (-1.7)=-2
	Range(nBegin,nEend,nStep)          -- ����һ����nBegin��ʼ,��nEend��ֹ,����ΪnStep������
	ReadCiKu(CiKuName)                 -- �ʿ����
	SetFZMCode(aa)                     -- �ɲ�εݽ���ϵ���ɲ�εݽ�����(���÷�����)
	Split(ss,ch)                       -- �зֺ���,chΪ�ָ���(�������ַ���)
	SplitCSV(ss,ch)                    -- CSV �ķֶ��зֺ���, �ն�Ҳ����, ��:"aaa","123",345,,12,uuu,"uuu , ssd f"
	SplitSQL(ss)                       -- SQL �ķֶ��зֺ���, �ն�Ҳ����
	ShenFenZheng(sfz)                  -- ���֤У��, ����3�����,1:У������ֵ, 2:У����, 3:������Ϣ(��ȷʱΪ�մ�)
	Str0(nNum,nLen)                    -- �ַ�������Ҫ��λ���Զ�����
	Trim(ss)                           -- ȥ��ǰ��ո�,tab,�س���,���з�
	ToNumber(aa)                       -- ת��Ϊ��ֵ��, �����ַ���, һά����, ��ά����,...
	JZPrint(aa,ch,fp)                  -- �������, �����ǵ�����,һά��, ��ά��, ...
	JZPrintG(aa,ch,fp)                 -- �������, �����ǵ�����,һά��, ��ά��, ..., UTF8ת��GBK���
	ZDPrint(ZD)                        -- ����ֵ�ȫ������,�Բ�εݽ���ʽ����չ��
	ZDPrintG(ZD)                       -- ����ֵ�ȫ������,�Բ�εݽ���ʽ����չ��, UTF8ת��GBK���
	ZDLen(ZD)                          -- ����Ԫ�ظ���, ����ֵ����,���޵�ǰ��,����������е��ӱ�����ֵ�
	ZDSum(ZD)                          -- ����Ԫ��֮��, ����ֵ����,���޵�ǰ��,����������е��ӱ�����ֵ�

	-- �����ຯ��
	XL_Set(n,x)                        -- ������ֵ, n��Ԫ��, ȫ��ֵΪ��ֵx
	XL_SetN(n)                         -- ������ֵ, n��Ԫ��, ��i��Ԫ�ظ�ֵΪi
	XL_SetZD(XL)                       -- ����������һ���ֵ�, [key]=i,�ֵ�����Ϊ�������ڵ�λ�ú�, �ظ���Ϣ����ǰ���.
	XL_JiaoJi(XL1,XL2)                 -- ���Ͻ���,�������п�������ͬԪ��,Ҳ��һ��ȥ��
	XL_BingJi(XL1,XL2)                 -- ���ϲ���
	XL_ChaJi(XL1,XL2)                  -- ���ϲ
	XL_QuChong(XL)                     -- ȥ�������е��ظ�Ԫ��
	XL_Find(XL,str)                    -- �������Ԫ�ص����, ��������������
	XL_Copy(XL,nB,nE)                  -- �������յ��Ӽ�, ��ʼλ�ú���ֹλ��
	XL_CopyCol(XL,...)                 -- �������յ�����, ����ĸ����б�,����(XL,1,3,4)
	XL_Sum(XL,nB,nE)                   -- �������, ��ʼλ�ú���ֹλ��
	XL_FZCount(XL,nB,nE)               -- �����ķ���ͳ��, �����ֵ�, [key]=����
	XL_NiXu(XL)                        -- ��������
	XL_NiXuShu(XL)                     -- ������
	XL_NeiJi(XL1,XL2)                  -- �������ڻ�
	XL_JiaJiao(XL1,XL2)                -- �����ļн�
	XL_XiangGuanXiShu(XL1,XL2)         -- ���������ϵ��
	XL_Foramt(XL,ch,m,cr)              -- �����������ʽ,�ָ���ch,ÿ�и���m,�������ͨ����\n
	XL_LuanXu(XL,ii,jj)                -- ��������, ��iiλ�õ�jjλ��, ȫ����Ϊ(XL)
	XL_DuanBiao(XL,Duan)               -- ����������ݵķֶ�λ��
	XL_DuanReSet(XL,Biao)              -- �ȱ任, ��ԭ�е�XL��������,����Biao�ķֶ�λ��,��ǳɶκ�
	XL_DuanWeiZhi(XL)                  -- ����Ķ�λ��
	XL_iMax(XL)                        -- ���������ֵλ��
	XL_iMaxAbs(aa)                     -- �����ľ���ֵ���ֵλ��
	XL_iMin(aa)                        -- ��������Сֵλ��
	XL_iMinAbs(XL)                     -- �����ľ���ֵ��Сֵλ��
	XL_UTF8(UTF8S)                     -- UTF8�ַ����ֽ����������
	XL_FenBuLSH(ZD,nn)                 -- �ֲ�����ɢ���б�, �ֵ�, ���б�Ĵ�С

	-- �����ຯ��
	JZ_Set(m,n,x)                      -- ����ֵ A_mn=x
	JZ_SetI(n)                         -- ��λ��ֵ A_nn=I
	JZ_Copy(JZ,rB,rE,cB,cE)            -- ������Ӽ�, �п�ʼλ�ú�����ֹλ��, �п�ʼλ�ú�����ֹλ��
	JZ_CopyRow(JZ,...)                 -- ���������
	JZ_CopyCol(JZ,...)                 -- ���������
	JZ_SumR(JZ,rB,rE,cB,cE)            -- ����������,��������, �п�ʼλ�ú�����ֹλ��, �п�ʼλ�ú�����ֹλ��
	JZ_SumC(JZ,rB,rE,cB,cE)            -- ����������,��������, �п�ʼλ�ú�����ֹλ��, �п�ʼλ�ú�����ֹλ��
	JZ_SumRow(JZ,...)                  -- ���������, �����к�֮��, ָ��������,���򷵻�ȫ���кͱ�,����(JZ,1,3,5)
	JZ_SumCol(JZ,...)                  -- ���������, �����к�֮��, ָ��������,���򷵻�ȫ���кͱ�,����(JZ,2,4,6)
	JZ_ChengFa(JZ1,JZ2)                -- ����˷�, Ҫ��JZ1����������JZ2������
	JZ_FZCount(JZ,...)                 -- ������з���ͳ��,Ĭ��ȫ������ͬ�߼���,��άָ��������(JZ,1,3),��1,3�е�����ͳ��.
	JZ_ZhuanZhi(JZ)                    -- ����ת��
	JZ_DuanBiao(JZ,Duan,nCol)          -- ��þ����nCol�еķֶ�λ��
	JZ_DuanReSet(JZ,Biao,nCol)         -- �ȱ任, ��ԭ�еľ���JZ��nCol������,����Biao�ķֶ�λ��,��ǳɶκ�
	JZ_DuanWeiZhi(JZ,nCol)             -- �����λ��
	JZ_iMax(JZ,nCol)                   -- �����nCol�����ֵλ��
	JZ_iMaxAbs(JZ,nCol)                -- �����nCol�о���ֵ���ֵλ��
	JZ_iMin(JZ,nCol)                   -- �����nCol����Сֵλ��
	JZ_iMinAbs(JZ,nCol)                -- �����nCol�о���ֵ��Сֵλ��
	JZ_HLS(JZ)                         -- ���������ʽ
	JZ_Ni(JZ)                          -- �����
	JZ_SVD(JZ)                         -- �����SVD�ֽ�,JZ_{m,n}�ֽ�ΪU*W*V', ����U_{m,n},W_n,V'_{n,n}, WΪ����ֵ�Խ���, VΪ������
	JZ_DataZip(JZ)                     -- �������ݽ�����ʽ�洢, ��ÿһ�����ݵ�[0]�д洢���ݵļ�¼����, �ظ�����ɾ��.
	JZ_FromZD(ZD,px)                   -- ���ֵ���Ϣ���������, ���px������Ա�����, pxΪ��������м���, ����{1}, Ԫ��������ʾ������.
	JZ_Sort(JZ,px)                     -- ��������, pxΪ��������м���, ����{1}, Ԫ��Ϊ����ʾ����, Ԫ��Ϊ��Ϊ����.

	-- �����ຯ��
	InitRand(speed)                    -- ���������������,����Ϊ2147483648,��21��
		*Rand=InitRand(1)              -- ��ʼ�����������������������Ϊ���������, �Ѿ�������
		Rand=InitRand(os.time())       -- ��ʼ���������������������ʱ����Ϊ���������, ��Ҫ���¶���
	RandNormal()                       -- ��׼��̬�����������(-4,+4)
	GL_LnGamma(xx)                     -- ����Gamma����
	GL_gamma2x(a,x)                    -- ����ȫGamma����
	GL_Gamma2d(a,x)                    -- ����ȫ��Gamma����
	GL_GammaP(a,x)                     -- ����ȫGamma����P��ʽ
	GL_Betacf(a,b,x)                   -- ����ȫ��������
	GL_Betai(a,b,x)                    -- ����I
	GL_I(x,a,b)                        -- Beta�ֲ�
	GL_ef(y,n1,n2)                     -- ���ַ���ֵ

	GL_NormP(x)                        -- �ܶȺ���: ��׼��̬�ֲ�
	GL_ChiSquareP(x,n)                 -- �ܶȺ���: �����ֲ�, nΪ���ɶ�
	GL_TiDistP(t,n)                    -- �ܶȺ���: T�ֲ�,���ɶ�Ϊn
	GL_FisherP(f,n1,n2)                -- �ܶȺ���: F�ֲ�,���ɶ�Ϊn1��n2

	GL_NormalQ(Q)                      -- ��λ��: ��׼��̬�ֲ�
	GL_StudentQ(q,n)                   -- ��λ��: T�ֲ�
	GL_FisherQ(q,m,n)                  -- ��λ��: F�ֲ�?
	GL_U(x,a,b)                        -- ��λ��: F�ֲ�?

	GL_BinomialSum(k,n,p)              -- �ֲ�����: ����ֲ�
	GL_Normal7(x)                      -- �ֲ�����: ��̬�ֲ�
	GL_PoissonSum(L,k)                 -- �ֲ�����: ���ɷֲ�
	GL_TdistSum(p,n)                   -- �ֲ�����: T�ֲ�
	GL_FisherSum(p,n1,n2)              -- �ֲ�����: F�ֲ�

	GL_XL_JZFC(XL)                     -- ��������ľ�ֵ����׼��, һά����, ԭʼ����(����Xi).
	GL_JZ_JZFC(JZ)                     -- ��������ľ�ֵ����׼��ܸ���, ��ά����, ԭʼ���ݵķ���ͳ������(����Xi,����)
	GL_MoNi_LS(Px)                     -- ��ɢ�ͷֲ���ģ��, ����:���ʱ�
	GL_MoNi_LX(fx,x1,x2)               -- �����ͷֲ���ģ��, ����:�ܶȺ���

	-- ������
	Int_nChaiFen(num)                   -- ʮ�����������
	Int_sChaiFen(str)                   -- �����ַ�����ֲ�ת��Ϊ�������飬���ӵ�λ����λ��˳��洢
	Int_ChengFa(p,q)                    -- �������˷� r=p*q, ���� p,q ��Ϊ����
	Int_GongYueShu(a,b)                 -- ���Լ�� (a,b)=d
	Int_BDFangCheng(a,b,c)              -- ����������� ax+by=c, ���ؽ�(x,y)
	Int_PaiLie_Init(xx,nn)              -- ����, ��һ�����������ȫ����,����С�����˳�����,ÿ�β���һ��
		PaiLie=Int_PaiLie_Init(xx,nn)   -- ����xx={}; PaiLie=Int_PaiLie_Init(xx,5) ��ʾ5������ȫ����, ��Ҫ���¶���
	Int_ZuHe_Init(xx,nn,mm)             -- ���, ��������,˳�������һ�����C_n^m
		ZuHe=Int_ZuHe_Init(xx,nn,mm)    -- ����xx={}; PaiLie=Int_ZuHe_Init(xx,5,3) ��ʾ5������ȡ3�������, ��Ҫ���¶���
	Int_PaiLie_H2S(n,m)                 -- ���к�ת��Ϊ��Ӧ������,n�����ĵ�m����������,����(5,100),5����������,�ֵ����еĵ�100λ��
	Int_PaiLie_S2H(xx)                  -- ����ת��Ϊ��Ӧ�����к�,ĳһ��������51342, ��������ֵ����е�λ��

	-- ���ļ��ຯ��
	File_Read(sFile,ch)                              -- �ļ�����, chû��Ĭ��ֵ, (sFile):����ֲ���������, (sFile,ch):��ֲ�����������ĩ��ȫ��ʱ, ɾ��ĩ��
	File_Read_n(sFile,ch,...)                        -- �ļ����벢ת��Ϊ��ֵ, (sFile):����ֲ�����������, (sFile,ch):��ֲ�����������ĩ��ȫ��ʱ, ɾ��ĩ��
	File_CountField(sFile,ch)                        -- �ļ�ͳ��,��¼���ֶθ����б�,���ڼ�¼���������ֶεĸ���ͳ��
	File_CountColValue(sFile,ch)                     -- �ļ�ͳ��,��¼������(������)ȡֵ�����ͳ���б�
	File_ReadCode(sFile,ch)                          -- �������ӳ����ձ�, Ĭ��ch=\t,����:aa<tab>11<tab>22
	File_ReadCode_n(sFile,ch)                        -- �������ӳ����ձ�, Ĭ��ch=\t,����:32<tab>11<tab>22, �״���ת��Ϊ��
	File_View(sFile,nNum)                            -- ��ʾ�ļ�ǰnNum������,nNum��ʾ��Ӧ����
	File_View2(sFile,nNum)                           -- ���ն�������ʾ�ļ�����,nNum=-1��ʾȫ��,������ʾ��Ӧ����
	File_View16(sFile,nNum)                          -- ����ʮ��������ʾ�ļ�����,nNum=-1��ʾȫ��,������ʾ��Ӧ����
	File_CompText(sFile1,sFile2)                     -- �Ƚ��ļ�,�ҵ������ļ��Ĳ�֮ͬ��
	File_SQLToTxt(sqlFile,txtFile)                   -- SQL �ļ�ת��Ϊ Text �ļ�
	File_TxtToSQL(txtFile,sqlFile,sTable)            -- Text �ļ�ת��Ϊ SQL �ļ�
	File_Date_Read(sFile)                            -- �ļ�����Ϊ�����б�, ���������б��ֵ�
	File_Date_Write(sFile,DateList)                  -- ��д�ļ�, �����б��ֵ�д�뵽�ļ���, ���Ϊ�����ֵ�, ϵͳ�Զ�����, Ȼ��洢.
	File_Del_DiPinCi(inFile,ouFile,CiKu,nMin)        -- �ļ�ɾ����Ƶ��; �����ļ�,����ļ�,�ʿ�,��С��Ƶ

	-- ���ļ��ຯ��
	Files_Copy(inFiles,ouFile,nMax)                  -- ���ļ�����
	Files_CountCol(inFiles,ch,ouFile)                -- ͳ���ļ��е�������,������ļ�ouFileʱ,ϵͳֱ������Ļ����ʾ���
	Files_FZCount(inFiles,...)                       -- ���ļ���¼���ķ���ͳ��
	Files_View(inFiles,nNum,ouFile)                  -- ��ȡ�ļ����е�ÿһ���ļ���ǰnNum����Ϣ��ouFile�л���ʾ����Ļ��
	Files_Read(inFiles)                              -- �Ӷ��ļ���һ��,inFileΪ�����ļ�����
		ReadLine=Files_Read(inFiles)                 -- ��ʼ���Ӷ��ļ���һ��, ��Ҫ���¶���
	Files_Write(ouFile,nMax)                         -- �����ļ���д��һ�л����
		WriteLine=Files_Write(ouFile,4)              -- ��ʼ�����ļ�(�ļ���,����¼��), ��Ҫ���¶���
	Files_Sort(inFiles,ouFile,px,inNum,OuNum,ch)     -- ���ļ�����,�����ļ��б�,����ļ�����,�������,��ּ�¼��С,����ļ���¼��,�ָ���
		px=function (a,b) if a[2]~=b[2] then return a[2]<b[2] else return a[1]<b[1] end -- �Ȱ��ڶ�����,�������ٰ���һ������, ��Ҫ���¶���
	Files_Sorts(inFiles,ouFiles,px,ch1,ch2)          -- ���ļ�����������,�����ļ��б�,����ļ��б�,�������,ԭ�ָ���,�·ָ���
	Files_SortGB(inFiles,ouFile,px,OuNum,ch)         -- ��·�鲢����,�����ļ��б�,����ļ�����,�������,����ļ���¼��,�ָ���
	Files_SortGBF(inFilesF,ouFile,px,OuNum,ch)       -- ��·�鲢����,�����ļ��б���,����ļ�����,�������,����ļ���¼��,�ָ���
	Files_OutErrLine(inFiles,ch,num,ouFile)          -- �������������Ϣ
	Files_OutTrueLine(inFiles,xzFiles,ch,num,ouFile) -- �����ȷ����
	Files_ListDir(sPath)                             -- ����ļ��м������ļ����µ�ȫ���ļ��б�
	Files_FindTxt(sss)                               -- �����ļ��б��е��ض��ַ���,�����ִ�Сд
	Files_FindBin(sss)                               -- �����ļ��б��е��ض��ַ���,���ִ�Сд

	-- �����ຯ��
	Date_RN(Nian)                                    -- �ж��Ƿ�������
	Date_t(nsDate)                                   -- ת��Ϊ��������:��,��,��
	Date_n(nsDate)                                   -- ���ַ���������ת��Ϊ��ֵ������,��1986-01-01ת��Ϊ19860101
	Date_s(nsDate)                                   -- ����ֵ������ת��Ϊ�ַ���������,��19860101ת��Ϊ1986-01-01
	Date_Add(nsDate,ndd,nmm,nyy)                     -- ��ǰ����, ����������, �������40��:(nsDate,40),��ǰ50��:(nsDate,-50)
	Date_sub(nsDate1,nsDate2)                        -- �����ַ�������֮������,1900�굽2099��, ���� 2005-10-03, 2006-01-04
	Date_XQ(nsDate)                                  -- ��������,0:������,1:����һ,...,6:������
	Date_GZR(nsDate)                                 -- �ж�������, ������:������,��:��Ϣ��, ��һ������Ϊ������, ����������Ϊ��Ϣ��, �����ֽڼ���
	Date_ZhSh(nsDate)                                -- �����������
	DateTime_Add(DateTime,n)                         -- ��ǰʱ����� n ��, ��ǰʱ��Ϊ: 2015-01-01 00:00:00
	DateTime_sub(DateTime1,DateTime2)                -- �����ַ���ʱ��֮������,���� 2015-01-01 08:09:10, 2015-01-02 18:12:10

	-- �ı������ຯ��
	Str_DelAsciiChar(ss)                             -- ɾ������Ascii�ַ�, ��������ͨ�ĺ����ַ�
	Str_DelAsciiChar_GBK(ss)                         -- ɾ������GBK�����ַ�, ɾ��Ascii�ַ�, ��������ͨ�ĺ����ַ�
	Str_DelAsciiChar_UTF8(str)                       -- ɾ������UTF8�����ַ�, ɾ��Ascii�ַ�, ��������ͨ�ĺ����ַ�
	Str_Test_CJKA_All(str)                           -- ����ַ������Ƿ�ȫΪCJK-A����, ȫ������:true, û��:false,�����ڷ�CJKA����
	Str_NiX_FenCi(mm,CiKu)                           -- �ı��ַ�������ִ�; �ı���, �ʿ�
	Str_ZhX_FenCi(mm,CiKu)                           -- �ı��ַ�������ִ�; �ı���, �ʿ�
	Str_ZhX_FenCi1(mm,CiKu)                          -- �ı��ַ�������ִ�; �ı���, �ʿ�, ����Ҳ���, ����UTF8�ַ�����
	Str_ZhX_FenCi2(mm,CiKu)                          -- �ı��ַ�������ִ�; �ı���, �ʿ�, ���ֲ����, ����UTF8�ַ�����
	Str_TxtToXiangLiang(tStr,tTZC)                   -- �ı�����������ʾ, tStr:���������ʱ�,tTZC:�ʿ��(һά��ͨ�ʴ�����)
	Str_FindWords(str,list)                          -- ���ַ�������Ѱһ������,�����ͬʱ����ʱΪ��
	Str_FindBDS_Init(sFile)                          -- ���������ʼ��: ����","����"+"ȥ��"-", ���ظ�ʽ�б���������б�
	Str_FindBDS(mm,List)                             -- ��������, ��������
	Str_Check_UTF8(UTF8S)                            -- ���UTF8�ַ����Ƿ���ȷ, ȥ�����Ϸ����ַ�.

	-- �������ݴ�����
	Tree_AllPath(Biao,nKey,nValue)                   -- ���ݲ�εݽ���ϵ, ����ĳ�����ݵ�ȫ��·��
	Tree_Struct(Biao,nKey)                           -- �������Ĳ㼶�ṹ
	Tree_Join(List,Data,BZList,nw,ch)                -- ����Join��
	Tree_Power(TB)                                   -- �������Ȩ��ת��Ϊ����Ȩ��

	-- ���㡢�����ຯ��
	JS_PQvalue(Pi,Qi)                                -- ��ֵ�Լ���, ������ǰ�÷�ΪPi,���ۺ�÷�ΪQi,i=1,...,n
	JS_Cronbach(Array,Col1,Col2)                     -- ���ʰͺ�ϵ��, �����Ŷȼ�⹫ʽ
	JS_KendallsW(Array)                              -- �ϵ¶���гϵ��, �Ŷȼ��鹫ʽ
	JS_NiXuShuBaiFenBi(xx)                           -- �������ٷֱ�, �����Լ���
	JS_KernelRegression(JZ,xh)                       -- ���ܶȺ����ع����
	JS_KaFang2p(data1,data2)                         -- 2*p����ͳ����data1:����,data2:ʵ��
	JS_KaFang22(n11,n12,n21,n22)                     -- 2*2����ͳ����, �����������ӳ�����������
	JS_Shang(data)                                   -- ��
	JS_ZuShang(JZ)                                   -- ����, ����������������������, ��ÿһ����س��Է������.
	JS_NewShang(data1,data2)                         -- ���������
	JS_BianJie_Fangxing(JZ)                          -- �����α߽�, Ϊ�˷�ֹͼ���Զ������任
	JS_BianJie_JuXing(JZ)                            -- ���α߽�, Ϊ�˷�ֹͼ���Զ������任

	--����K2�㷨�ı�Ҷ˹��ѧϰ
	K2_Count(ii, sii, jj, sjj, kk, skk)              -- ͳ�Ʒ��������ļ�¼����
	K2_JSGen(ii)                                     -- ������ڵ�÷�
	K2_Fu1(ii,jj)                                    -- �����һ�����ڵ�ĵ÷�
	K2_Fu2(ii,jj,kk)                                 -- �����������ڵ�ĵ÷�
	K2_Main(sCode)                                   -- K2�㷨���ĳ���, ���ڵ������������Ϊ2
	K2_OutN(sCode,sp)                                -- ��Ҷ˹�����
	K2_OutP(sCode,sp)                                -- ��Ҷ˹������������ʷֲ�

	-- �Ŵ��㷨, ����ĳһ����������
	YC_Init()                                        -- ��Ⱥ��С, ���峤��
	YC_Main(nCiShu)                                  -- ��������, ��������nCiShu
		*YC_px=function (a,b) return a[0]>b[0] end   -- ϵͳĬ��0���д���Ⱥ����Ӧ��, �Ѿ�������
	YC_BianYi(kk)                                    -- �Ŵ�����
	YC_LianSuo(n1,n2)                                -- ������������
	YC_LSTiaoZheng(nn)                               -- ���������������λ�õ���

	-- ���ࡢ�����㷨
	PB_OShiJuLi(point1,point2)                       -- �����������ŷ�Ͼ����ƽ��
	PB_JiaoChaHeShi(JZ,bb,panbie)                    -- �����ʵ��֤(���ݾ���, ���ݷ���, ��ȡ�������ݺ���)
	PB_KNN(data,test)                                -- K�����㷨(ѵ��������, ���Լ�����)
	PB_Bayes_TextCreatModel(DM_File,XL_File,CiKu)    -- ��Ҷ˹�б�ģ; �����ļ�, �ı��ļ�
	PB_Bayes_Text_PB(ss,CiKu,Power)                  -- ��Ҷ˹�ı��б�; �ı��ļ�, ����ģ��
	PB_Beyes_TextOptionWrite(XL_File,Power)          -- ���ļ�д������ģ��,�޷���ֵ
	PB_Beyes_TextOptionRead(XL_File)                 -- ���ļ����������ģ��,����ģ�ͱ� Power

	SysOpt[?]                                        -- ϵͳ����

	-- GBK��UTF8�໥ת�����ļ�(GBK_UTF8.lua)
	GbkToUTF8(str)                                   -- ��GBK�ַ���str, ת��ΪUTF8
	UTF8ToGbk(str)                                   -- ��UTF8�ַ���str, ת��ΪGBK
	GbkToUTF8s(list)                                 -- �������еĶ���ַ���ת��
	UTF8ToGbks(list)                                 -- �������еĶ���ַ���ת��
	File_GBK_to_UTF8(sFile1,sFile2)                  -- ��GBK�ļ� ת��Ϊ UTF8�ļ�
	File_UTF8_to_GBK(sFile1,sFile2)                  -- ��UTF8�ļ� ת��Ϊ GBK�ļ�
--]=]

----------------------------------------------------------------------------------------------------------------
-- ��num���ն�����8λ��ʾ
function Bin8(num,ch)
	local ss=""
	num=num%256
	for i=1,8 do
		ss=(num%2)..ss
		num=(num-num%2)/2
	end
	return (ch or "") .. ss
end

-- ��num���ն�����16λ��ʾ
function Bin16(num,ch)
	return Bin8((num-num%256)/256,ch) .. Bin8(num,ch)
end

-- �����洢��, ��һϵ�б����洢������, �������Դ洢���ⲿ�ļ���
function BLSave(...)
	local nn=select("#",...)
	local Biao={}
	for i=1,nn do
		local aa=select(i,...)
		if type(aa) ~= "table" then
			Biao[#Biao+1]={0,"number",0,type(aa),aa}  -- ֱ�ӽ���
		else
			Biao[#Biao+1]={0,"number",0,"table",1}  -- ��3�м�¼�˱�������Ч����
			local nBiao=#Biao  -- �������ʼλ��
			local rr,ii={aa},1
			while ii<=#rr do  -- ʹ�ö�ջ����ʵ�ֹ����������
				for k in pairs(rr[ii]) do
					if type(rr[ii][k]) == "table" then
						rr[#rr+1] = rr[ii][k]
						Biao[#Biao+1] = {ii,type(k),k,type(rr[ii][k]),#rr}
					else
						Biao[#Biao+1] = {ii,type(k),k,type(rr[ii][k]),rr[ii][k]}
					end
				end
				ii=ii+1
			end
			Biao[nBiao][3]=#Biao - nBiao  -- ��3�м�¼�˱�������Ч����
		end
	end
	return Biao
end

-- �������洢���е���Ϣת����һϵ�б�������
function BLLoad(Biao)
	local FH,LS={},{}
	for i=1,#Biao do  -- ����Ƿ���Ϲ���, ���ļ���ֱ�Ӷ�������ݲ����Ϲ���,��Ҫ����ת��
		if type(Biao[i][1]) ~= "number" then Biao[i][1]=tonumber(Biao[i][1]) end
		if Biao[i][2] == "number" and type(Biao[i][3]) == "string" then Biao[i][3]=tonumber(Biao[i][3]) end
		if Biao[i][4] == "number" and type(Biao[i][5]) == "string" then Biao[i][5]=tonumber(Biao[i][5]) end
		if Biao[i][4] == "table" then Biao[i][5]=tonumber(Biao[i][5]) end
	end
	for i=1,#Biao do
		if Biao[i][1]==0 then
			if Biao[i][3]==0 then
				FH[#FH+1]=Biao[i][5]
			else
				LS={{}}
				FH[#FH+1]=LS[1]
			end
		else
			local k=Biao[i][3]
			if Biao[i][4]=="table" then
				LS[Biao[i][1]][k]={}
				LS[Biao[i][5]]=LS[Biao[i][1]][k]
			else
				LS[Biao[i][1]][k]=Biao[i][5]
			end
		end
	end
	return unpack(FH)  -- �����б�
end

function BLView(Biao)  -- ��ʾ�������ݼ���������ϵ
	local k1,k2
	if Biao[1][4]=="table" then
		k1,k2=Biao[1][5],#tostring(Biao[1][5]) ..Biao[1][5].."."
		Biao[1][5]=k2
		for i=2,#Biao do
			if Biao[i][1]==k1 then Biao[i][1]=k2 end
		end
	end
	for i=2,#Biao do
		if Biao[i][4]=="table" then
			k1,k2=Biao[i][5],Biao[i][1]..#tostring(Biao[i][5])..Biao[i][5].."."
			Biao[i][5]=k2
			for j=i+1,#Biao do
				if Biao[j][1]==k1 then Biao[j][1]=k2 end
			end
		end
	end
	Biao[1][1]=Biao[1][5]
	local m,old=0,""
	for i=2,#Biao do
		m=Biao[i][1]~=old and 1 or m+1
		if m==1 then old=Biao[i][1] end
		Biao[i][1]= Biao[i][4]=="table" and Biao[i][5] or Biao[i][1]..#tostring(m)..m.."."
	end
	table.sort(Biao,function (a,b) return a[1]<b[1] end)
	local data={}
	for i=2,#Biao do
		local ss=Split(Biao[i][1],".")
		local mm=""
		for j=4,#ss do
			mm=mm .. "\t"
		end
		if Biao[i][2]=="string" then
			mm=mm ..'["'..Biao[i][3]..'"]:'
		elseif Biao[i][2]=="number" then
			mm=mm ..'['..Biao[i][3]..']:'
		end
		if Biao[i][4]=="string" then
			mm=mm ..'"'..Biao[i][5]..'"'
		elseif Biao[i][4]=="number" then
			mm=mm ..''..Biao[i][5]..''
		end
		data[i-1]=mm
	end
	return table.concat(data,"\n")
end

-- ��ƴ�Ӻ���,������ֱΪ�ַ���
function ConCat(tt,ch)
	if type(tt) ~= "table" then return tt end
	local res={}
	for i=1,#tt do
		res[i]=ConCat(tt[i],ch)
	end
	return table.concat(res,ch or "")
end

-- �ֵ�ƴ�Ӻ���,���ֵ���ֱΪ�ַ���
function ConCatKey(tt,ch)
	if type(tt) ~= "table" then return tt end
	local res={}
	for k in pairs(tt) do
		res[#res+1]=k
	end
	return table.concat(res,ch or "")
end

Cpu_Time=os.clock()
function Cpu(str)  -- ��ʾ�Ѿ����е�CPUʱ��
	print((str or ""), os.clock()-Cpu_Time)
	Cpu_Time=os.clock()
end

-- ����ֵ������ַ���, Ȼ���������ֵ.
function GetStrKey(tt)
	if type(tt) ~= "table" then return {} end
	local res={}
	for k in pairs(tt) do
		if type(k)=="string" then
			res[#res+1]=k
		end
	end
	table.sort(res)
	return res
end

-- ɾ��HTML�е�<>�ڵĸ��ֿ�������
function DelHtml(ss)
	local flag,mm,ii=0,"",1
	while ii<=#ss do
		if flag==0 then
			if ss:sub(ii,ii)=="<" then flag=1 else mm=mm .. ss:sub(ii,ii) end
		else
			if ss:sub(ii,ii)==">" then flag=0 end
		end
		ii=ii+1
	end
	return mm
end

-- ���Һ���
function Find(ss,chs) -- ���Һ���
	if ss==nil or ss=="" then return nil end
	local i,j,ch=0,0,""
	local bs,bss={},"().%+-*?[]^$" -- ȥ������ħ���ַ�
	for i=1,#bss do bs[bss:sub(i,i)]=true end
	for k=1,#chs do
		if bs[chs:sub(k,k)] then ch=ch.."%"..chs:sub(k,k) else ch=ch..chs:sub(k,k) end
	end
	i,j=ss:find(ch)
	return i
end

-- �����ļ�������չ��
function FileName(sFile)
	local oufpN=Split(sFile,".")
	local oufpK=""        -- �ļ���չ��
	local oufpM=sFile     -- �ļ���
	if #oufpN>=2 then  -- ������չ��
		oufpK=oufpN[#oufpN]
		oufpN[#oufpN]=nil
		oufpM=table.concat(oufpN,".")
	end
	return oufpM,oufpK
end

-- ȡ������
function Int(aa)
	return aa-aa%1
end

-- ����һ����nBegin��ʼ,��nEend��ֹ,����ΪnStep������
function Range(nBegin,nEend,nStep)
	local nTable={}
	nStep=nStep or 1
	for ii=nBegin,nEend,nStep do
		nTable[#nTable+1]=ii
	end
	return nTable
end

-- �ʿ����
-- ����: Ciku[1]="����",  Ciku["����"]=1
-- ��ĵ����ֽڳ���: CiKu["#"],
-- ��ĵ����ֳ���:   CiKu["##"]
-- �÷�: CiKu=ReadCiKu("CiKuWord.txt")
function ReadCiKu(CiKuName)
	local fp1=assert(io.open(CiKuName,"r"))
	local nCi,CiKu,mm=0,{},""
	while true do
		mm=fp1:read("*line")
		if mm==nil then break end
		if mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
		nCi=nCi+1
		CiKu[nCi]=mm
		CiKu[mm]=nCi
	end
	fp1:close()
	local DCMax=0  --��ôʿ������ʵĳ���
	for i=1,#CiKu do
		if #CiKu[i]>DCMax then DCMax=#CiKu[i] end
	end
	CiKu["#"]=DCMax  -- ���ֽڼ��㳤��
	local DCMax=0  --��ôʿ������ʵĳ���
	for i=1,#CiKu do
		local tt=XL_UTF8(CiKu[i])
		if #tt>DCMax then DCMax=#tt end
	end
	CiKu["##"]=DCMax  -- ���ּ��㳤��
	return CiKu
end

-- �ɲ�εݽ���ϵ���ɲ�εݽ�����
function SetFZMCode(aa)
	local Tree={}  -- ��
	local num={}  -- ���
	local rec={}
	for ii=1,#aa do
		for jj=1,#aa[ii] do
			local ss=table.concat(aa[ii],"\t",1,jj)
			if Tree[ss]==nil then
				num[jj]=(num[jj] or (jj==1 and 10 or 0))+1
				num[jj+1]=nil
				Tree[ss]=""
				for kk=1,#num do
					Tree[ss]=Tree[ss]..(num[kk]<=9 and "0"..num[kk] or num[kk])
				end
				rec[#rec+1]={ss,Tree[ss]}
			end
		end
	end
	return rec
end

-- �зֺ���
function Split(ss,chs) -- �ֶ��зֺ���, �ն�Ҳ����, ȫ��ʱ���ؿձ�, ���򷵻طǿձ�
	if ss==nil or ss=="" then return {""} end
	if chs=="" then return {ss} end
	local i,j,p,ch,nfs,nss=0,0,1,"",0,0
	local fs,bs,bss={},{},"().%+-*?[]^$" -- ȥ������ħ���ַ�
	for i=1,#bss do bs[bss:sub(i,i)]=true end
	for k=1,#chs do
		if bs[chs:sub(k,k)] then ch=ch.."%"..chs:sub(k,k) else ch=ch..chs:sub(k,k) end
	end
	--ȥ��β���Ļس��������ļ��ж�ȡ������Щ���лس����������з�������
	if ss:sub(-1,-1)==string.char(13) then ss=ss:sub(1,-2) end
	nss=#ss
	while true do
		i,j=ss:find(ch, p)
		if i == nil then
			nfs=nfs+1
			if p>nss then fs[nfs]="" else fs[nfs]=ss:sub(p) end
			break
		end
		nfs=nfs+1
		if p>i-1 then fs[nfs]="" else fs[nfs]=ss:sub(p,i-1) end
		p=j+1
	end
	return fs
end

-- CSV �ķֶ��зֺ���, �ն�Ҳ����, ��:"aaa","123",345,,12,uuu,"uuu , ssd f"
function SplitCSV(ss,ch)
	local fs,fss=Split(ss,ch or ","),{}
	for i=1,#fs do
		if fs[i]=="" then
			fss[#fss+1]=""
		elseif fs[i]=='""' then
			fss[#fss+1]=""
		else
			local p,q=0,0
			for j=1,#fs[i] do if fs[i]:sub(j,j)~=" " then p=j; break end end
			if p==0 then
				fss[#fss+1]=""
			else  --ȥ��ÿһ�ε�ǰ��ո�Ȼ����ȥ��ÿһ�ε�����
				for j=#fs[i],1,-1 do if fs[i]:sub(j,j)~=" " then q=j; break end end
				if fs[i]:sub(p,p)=='"' then
					if fs[i]:sub(q,q)=='"' then
						fss[#fss+1]=fs[i]:sub(p+1,q-1)
					elseif i<#fs then
						fs[i+1]=fs[i] .. "," .. fs[i+1]
					else
						fss[#fss+1]=fs[i]
					end
				elseif fs[i]:sub(p,p)=="'" then
					if fs[i]:sub(q,q)=='"' then
						fss[#fss+1]=fs[i]:sub(p+1,q-1)
					elseif i<#fs then
						fs[i+1]=fs[i] .. "," .. fs[i+1]
					else
						fss[#fss+1]=fs[i]
					end
				else
					fss[#fss+1]=fs[i]:sub(p,q)
				end
			end
		end
	end
	return fss
end

--SQL��ʽ:
function SplitSQL(ss)  -- SQL �ķֶ��зֺ���, �ն�Ҳ����
	local aa=Split(ss,",")
	local bb,cc={},{}
	for i=1,#aa do bb[i]=Trim(aa[i]) end
	i=1
	while  i<=#bb do
		if #bb[i]==0 then
			cc[#cc+1]=""
		elseif bb[i]:sub(1,1)=="'" then
			if bb[i]:sub(-1,-1)=="'" then
				cc[#cc+1]=Trim(bb[i]:sub(2,-2))
			else
				if i<#bb then
					aa[i+1]=aa[i] .. "," .. aa[i+1]
					bb[i+1]=Trim(aa[i+1])
				else
					cc[#cc+1]=bb[i]
				end
			end
		elseif bb[i]:sub(1,1)=='"' then
			if bb[i]:sub(-1,-1)=='"' then
				cc[#cc+1]=Trim(bb[i]:sub(2,-2))
			else
				if i<#bb then
					aa[i+1]=aa[i] .. "," .. aa[i+1]
					bb[i+1]=Trim(aa[i+1])
				else
					cc[#cc+1]=bb[i]
				end
			end
		elseif bb[i]:sub(1,8)=="to_date(" then
			if bb[i+1]:sub(2,11)=="dd-mm-yyyy" then
				cc[#cc+1]=bb[i]:sub(16,19) .. bb[i]:sub(13,14) .. bb[i]:sub(10,11)
			elseif bb[i+1]:sub(2,11)=="yyyy-mm-dd" then
				cc[#cc+1]=bb[i]:sub(10,13) .. bb[i]:sub(15,16) .. bb[i]:sub(18,19)
			else
				print("Date error!")
			end
			i=i+1
		elseif bb[i]=="null" then
			cc[#cc+1]=""
		else
			cc[#cc+1]=bb[i]
		end
		i=i+1
	end
	return cc
end

-- ���֤У��, ����3�����,1:У������ֵ, 2:У����, 3:������Ϣ(��ȷʱΪ�մ�)
function ShenFenZheng(sfz)
	local nType=0
	local pp,m,k
	if #sfz~=18 then
		if #sfz==15 then
			for i=1,15 do --���ÿһ�������Ƿ�Ϊ 0~9
				if sfz:sub(i,i)<"0" or sfz:sub(i,i)>"9" then nType=i; break end
			end
			if nType==0 then
				sfz=sfz:sub(1,6) .. (tonumber(sfz:sub(7,8))>18 and "19" or "20") .. sfz:sub(7)
				local pp={string.byte(sfz,1,-1)}
				for i=1,17 do pp[i]=pp[i]-48 end
				local m,k=0,2
				for i=17,1,-1 do --���У��λ
					m=m+pp[i]*k;  k=k*2
				end
				m=(12-m%11)%11 --��ʵ���
				sfz=sfz .. (m==10 and "X" or m)
				nType=22
			end
		else
			nType=19
		end
	end
	if nType==0 then
		for i=1,17 do --���ÿһ�������Ƿ�Ϊ 0~9
			if sfz:sub(i,i)<"0" or sfz:sub(i,i)>"9" then nType=i; break end
		end
	end
	if nType==0 then
		if sfz:sub(18,18)<"0" or sfz:sub(18,18)>"9" then
			if sfz:sub(18,18)~="X" and sfz:sub(18,18)~="x" then nType=18 end
		end
	end
	if nType==0 then
		pp={string.byte(sfz,1,-1)}
		for i=1,17 do pp[i]=pp[i]-48 end
		m,k=0,2
		for i=17,1,-1 do --���У��λ
			m=m+pp[i]*k;  k=k*2
		end
		m=(12-m%11)%11 --��ʵ���
		if m==10 then
			if sfz:sub(18,18)~="X" and sfz:sub(18,18)~="x" then nType=20 end
		elseif m~=pp[18]-48 then
			nType=21
		end
	end
	local sStr=""
	if nType>=1 and nType<=18 then
		sStr="����:���֤����"..sfz.."�ĵ�"..nType.."λ���ַǷ��ַ�("..sfz:sub(nType,nType)..")."
	elseif nType==19 then
		sStr="����:���֤����"..sfz.."����18λ."
	elseif nType==20 then
		sStr="����:���֤����"..sfz.."У�������,��Ϊ"..sfz:sub(18,18).."ӦΪ'X'."
	elseif nType==21 then
		sStr="����:���֤����"..sfz.."У�������,��Ϊ"..sfz:sub(18,18).."ӦΪ'"..m.."'."
	elseif nType==22 then -- ����15λ����Ϊ18λ�Ľ��
		sStr=sfz
	end
	return nType==0,nType,sStr
end

function Str0(nNum,nLen)  -- �ַ�������Ҫ��λ���Զ�����
	local ss=tostring(nNum)
	if #ss<nLen then ss=string.rep("0",nLen-#ss)..ss end
	return ss
end

-- ȥ��ǰ��ո�,tab,�س���,���з�
function Trim(ss)
	if #ss==0 then return "" end
	local p,q=0,0
	local r1,r2,r3,r4=" ","\t",string.char(13),string.char(10)
	for i=1,#ss do
		if ss:sub(i,i)~=r1 and ss:sub(i,i)~=r2 and ss:sub(i,i)~=r3 and ss:sub(i,i)~=r4 then p=i; break end
	end
	if p==0 then return "" end
	for i=#ss,1,-1 do
		if ss:sub(i,i)~=r1 and ss:sub(i,i)~=r2 and ss:sub(i,i)~=r3 and ss:sub(i,i)~=r4 then q=i; break end
	end
	return ss:sub(p,q)
end

-- ת��Ϊ��ֵ��, �����ַ���, һά����, ��ά����,...
function ToNumber(aa)
	if type(aa) == "table" then
		for i=1,#aa do
			aa[i]=ToNumber(aa[i])
		end
	else
		aa=tonumber(aa)
	end
	return aa
end

-- �������, �����ǵ�����,һά��, ��ά��, ...
function JZPrint(aa,ch,fp)
	if type(aa) ~= "table" then  --��ͨ��
		if fp==nil then io.write(aa) else fp:write(aa) end
	elseif type(aa[1]) ~= "table" then --һά��
		if fp==nil then
			io.write(table.concat(aa,ch or "\t"),"\n")
		else
			fp:write(table.concat(aa,ch or "\t"),"\n")
		end
	else --��ά���ϵı�, �ݹ鴦��
		for i=1,#aa do
			JZPrint(aa[i],ch,fp)
		end
		if fp==nil then io.write("\n") else fp:write("\n") end
	end
end

-- �������, �����ǵ�����,һά��, ��ά��, ..., UTF8ת��GBK���
function JZPrintG(aa,ch,fp)
	if type(aa) ~= "table" then  --��ͨ��
		if fp==nil then io.write(aa) else fp:write(aa) end
	elseif type(aa[1]) ~= "table" then --һά��
		if fp==nil then
			for ii=1,#aa do
				if ii>1 then io.write(ch or "\t") end
				if type(aa[ii]) == "string" then
					io.write(UTF8ToGbk(aa[ii]))
				end
			end
			io.write("\n")
		else
			for ii=1,#aa do
				if ii>1 then fp.write(ch or "\t") end
				if type(aa[ii]) == "string" then
					fp.write(UTF8ToGbk(aa[ii]))
				end
			end
			fp.write("\n")
		end
	else --��ά���ϵı�, �ݹ鴦��
		for i=1,#aa do
			JZPrint(aa[i],ch,fp)
		end
		if fp==nil then io.write("\n") else fp:write("\n") end
	end
end

-- ����ֵ�ȫ������,�Բ�εݽ���ʽ����չ��
function ZDPrint(ZD)
	local NZD=BLSave(ZD)
	print(BLView(NZD))
end

-- ����ֵ�ȫ������,�Բ�εݽ���ʽ����չ��
function ZDPrintG(ZD)
	local NZD=BLSave(ZD)
	print(UTF8ToGbk(BLView(NZD)))
end

-- �������Ԫ�ظ���, ����ֵ����,���޵�ǰ��
function ZDLen(ZD)  -- ����Ԫ�ظ���
	local nn=0
	for k in pairs(ZD) do nn=nn+1 end
	return nn
end

-- ����Ԫ��֮��, ����ֵ����,���޵�ǰ��,����������е��ӱ�����ֵ�
function ZDSum(ZD)
	local nn=0
	for kk,uu in pairs(ZD) do nn=nn+uu end
	return nn
end

-- ������ֵ, n��Ԫ��, ȫ��ֵΪ��ֵx
function XL_Set(n,x)
	local aa={}
	for i=1,n do aa[i]=x end
	return aa
end

-- ������ֵ, n��Ԫ��, ��i��Ԫ�ظ�ֵΪi
function XL_SetN(n)
	local aa={}
	for i=1,n do aa[i]=i end
	return aa
end

-- ����������һ���ֵ�, [key]=i,�ֵ�����Ϊ�������ڵ�λ�ú�, �ظ���Ϣ����ǰ���.
function XL_SetZD(XL)
	local NZD={}
	for i=1,#XL do if NZD[XL[i]]==nil then NZD[XL[i]]=i end end
	return NZD
end

--���Ͻ���,�������п�������ͬԪ��,Ҳ��һ��ȥ��
function XL_JiaoJi(XL1,XL2)
	local aa,bb,cc=XL_SetZD(XL1),XL_SetZD(XL2),{}
	for kk in pairs(bb) do
		if aa[kk] then cc[#cc+1]=kk end
	end
	return cc
end

--���ϲ���
function XL_BingJi(XL1,XL2)
	local aa,bb,cc=XL_SetZD(XL1),XL_SetZD(XL2),{}
	for kk in pairs(aa) do cc[#cc+1]=kk end
	for kk in pairs(bb) do
		if aa[kk]==nil then cc[#cc+1]=kk end
	end
	return cc
end

--���ϲ
function XL_ChaJi(XL1,XL2)
	local bb,cc=XL_SetZD(XL2),{}
	for ii=1,#XL1 do
		if bb[XL1[ii]]==nil then cc[#cc+1]=XL1[ii] end
	end
	return cc
end

--ȥ�������е��ظ�Ԫ��
function XL_QuChong(XL)
	local aa,bb=XL_SetZD(XL),{}
	for kk in pairs(aa) do bb[#bb+1]=kk end
	return bb
end

-- �������Ԫ�ص����, ��������������
function XL_Find(XL,str)
	for i=1,#XL do if str==XL[i] then return i end end
	return 0
end

-- �������յ��Ӽ�, ��ʼλ�ú���ֹλ��
function XL_Copy(XL,nB,nE)
	nB=nB or 1;   nE=nE or #XL
	local aa={}
	for ii=nB,nE do
		aa[ii-nB+1]=XL[ii]
	end
	return aa
end

-- �������յ�����
function XL_CopyCol(XL,...)
	local aa,nn={},select("#",...)
	for jj=1,nn do
		aa[jj]=XL[select(jj,...)]
	end
	return aa
end

-- �������, ��ʼλ�ú���ֹλ��
function XL_Sum(XL,nB,nE)
	nB=nB or 1;   nE=nE or #XL
	local aa=0
	for ii=nB,nE do
		aa=aa+XL[ii]
	end
	return aa
end

-- �����ķ���ͳ��, �����ֵ�, [key]=����
function XL_FZCount(XL,nB,nE)
	nB=nB or 1;   nE=nE or #XL
	local aa={}
	for i=nB,nE do
		aa[XL[i]]=(aa[XL[i]] or 0) + 1
	end
	return aa
end

-- ��������
function XL_NiXu(XL)
	local aa={}
	for i=#XL,1,-1 do aa[#aa+1]=XL[i] end
	return aa
end

-- ������
function XL_NiXuShu(XL)
	local sum=0
	for ii=2,#XL do
		for jj=1,ii-1 do
			if XL[jj]>XL[ii] then sum=sum+1 end
		end
	end
	return sum
end

--�������ڻ�
function XL_NeiJi(XL1,XL2)
	local s=0
	for i=1,#XL1 do s=s+XL1[i]*XL2[i] end
	return s
end

--�����ļн�
function XL_JiaJiao(XL1,XL2)
	local sum=0
	for i=1,#XL1 do sum=sum+XL1[i]*XL2[i] end
	local s1=0
	for i=1,#XL1 do s1=s1+XL1[i]*XL1[i] end
	local s2=0
	for i=1,#XL2 do s2=s2+XL2[i]*XL2[i] end
	return sum/(s1*s2)^0.5
end

-- ���������ϵ��
function XL_XiangGuanXiShu(XL1,XL2)
	if #XL1~=#XL2 then return nil end
	local mu1,mu2=0,0
	for i=1,#XL1 do mu1=mu1+XL1[i]; mu2=mu2+XL2[i] end
	mu1,mu2=mu1/#XL1,mu2/#XL2
	local s1,s2,s3=0,0,0
	for i=1,#XL1 do s1=s1+(XL1[i]-mu1)^2; s2=s2+(XL2[i]-mu2)^2; s3=s3+(XL1[i]-mu1)*(XL2[i]-mu2) end
	return s3/(s1*s2)^0.5
end

--�����������ʽ,�ָ���ch,ÿ�и���m,�������ͨ����\n
function XL_Foramt(XL,ch,m,cr)
	local n=m or 0
	ch = ch or ""
	if n==0 then io.write(table.concat(XL,ch)); return end
	for i=1,#XL do
		io.write(XL[i],i<#XL and i%m~=0 and ch or "",i%m==0 and "\n" or "")
	end
	io.write(cr or "")
end

-- ��������, ��iiλ�õ�jjλ��, ȫ����Ϊ(XL)
function XL_LuanXu(XL,ii,jj)
	local k=0
	ii=ii or 1;  if ii<1 then ii=1 end
	jj=jj or #XL;  if jj>#XL then jj=#XL end
	for i=jj,ii,-1 do
		k=Rand()*(i-ii+1); k=k-k%1  -- ����һ�����λ��
		XL[i],XL[i-k]=XL[i-k],XL[i]  -- ��������
	end
end

-- ����������ݵķֶ�λ��
function XL_DuanBiao(XL,Duan)
	local Xu,Biao={},{}
	for ii=1,#XL do Xu[ii]=XL[ii] end
	table.sort(Xu)
	for i=1,Duan-1 do Biao[i]=Xu[(#Xu*i-#Xu*i%Duan)/Duan] end
	return Biao
end

-- �ȱ任, ��ԭ�е�XL��������,����Biao�ķֶ�λ��,��ǳɶκ�
function XL_DuanReSet(XL,Biao)
	local k=0
	for i=1,#XL do
		k=#Biao+1
		for j=1,#Biao do
			if XL[i]<=Biao[j] then k=j; break end
		end
		XL[i]=k
	end
end

-- ����Ķ�λ��
function XL_DuanWeiZhi(XL)
	local bb,tt={},0
	bb[1]={1,0}
	tt=XL[1]
	for i=2,#XL do
		if tt~=XL[i] then
			bb[#bb][2]=i-1
			bb[#bb+1]={i,0}
			tt=XL[i]
		end
	end
	bb[#bb][2]=#XL
	return bb
end

-- ���������ֵλ��
function XL_iMax(XL)
	local k=1
	for i=2,#XL do if XL[k]<XL[i] then k=i end end
	return k
end

-- �����ľ���ֵ���ֵλ��
function XL_iMaxAbs(XL)
	local k=1
	for i=2,#XL do if math.abs(XL[k])<math.abs(XL[i]) then k=i end end
	return k
end

-- ��������Сֵλ��
function XL_iMin(XL)
	local k=1
	for i=2,#XL do if XL[k]>XL[i] then k=i end end
	return k
end

-- �����ľ���ֵ��Сֵλ��
function XL_iMinAbs(XL)
	local k=1
	for i=2,#XL do if math.abs(XL[k])>math.abs(XL[i]) then k=i end end
	return k
end

-- UTF8�ַ����ֽ����������
function XL_UTF8(UTF8S)
	local Words={}  -- ����, �洢�ֽ��ĵ���
	local ii,pp,flag=1,0,0  -- ��ǰ���������ַ�λ��, ������ȷ���ֿ�ʼλ��, ��ǰ��״̬
	while ii<=#UTF8S do
		local Byte=string.byte(UTF8S:sub(ii,ii))  -- ��ȡһ���ֽ�
		local ss=Bin8(Byte)  -- ת���ɶ������ַ���, ��00011001
		if flag==0 then  -- ���ֿ�ʼ״̬
			if ss:sub(1,1)=="0" then  -- Ӣ����ĸ, ������<=127���ַ�
				Words[#Words+1]=UTF8S:sub(ii,ii)
			else -- ���ֽ��ַ�
				local kk=8  -- ��ʼ��Ϊ���λ��
				for jj=2,7 do  -- �ӵڶ���λ�ÿ�ʼ����Ƿ�Ϊ0, �ҵ�0���ֵ�λ��, �Ӷ�����������ֽڸ���
					if ss:sub(jj,jj)=="0" then kk=jj; break; end
				end
				if kk>=3 and kk<=7 then  -- kk=2: 10xxxxxx ����, ����ʼ����11XXXXXX; kk=8:����
					pp=ii    -- �洢���������ȷ�����ֵ���ʼλ��, �Ա��ں������з�
					flag=kk-2 -- ��ǰ�ֽ���ȷ, �ټ������k-2���ֽ��Ƿ���ȷ
				end
			end
		else
			if ss:sub(1,2)=="10" then
				flag=flag-1
				if flag==0 then Words[#Words+1]=UTF8S:sub(pp,ii) end
			else
				flag=0    -- ��ǰֵ����
				ii=ii-1   -- ��һ�������Ǵ����, ��ǰ������Ҫ�����ж�
			end
		end
		ii=ii+1
	end
	return Words
end

-- ZD[xi]=ni
-- �ֲ�����ɢ���б�
function XL_FenBuLSH(ZD,nn)  -- �ֲ�����ɢ��, �ֵ�, ���б�Ĵ�С
	local ii,Biao=0,{}
	local sum=ZDSum(ZD)
	if sum<=nn then  -- ���������Ͳ���, û��Ҫ��ɢ��
		for kk in pairs(ZD) do
			for mm=1,ZD[kk] do ii=ii+1; Biao[ii]=kk end
		end
	else
		local xBiao=JZ_FromZD(ZD,{-2,1}) -- �������Ӵ�С����, �ٰ���key��С��������
		for i=1,#xBiao do
			xBiao[i][2]=xBiao[i][2]/sum*nn
			while xBiao[i][2]>=1 do     -- �õ�����������Ϊ����
				xBiao[i][2]=xBiao[i][2]-1
				ii=ii+1
				Biao[ii]=xBiao[i][1]
			end
		end
		JZ_Sort(xBiao,{-2,1})  -- ��С����������һ������
		for i=1,#xBiao do
			if ii>=nn then break end
			ii=ii+1
			Biao[ii]=xBiao[i][1]
		end
	end
	return Biao
end

-- ����ֵ A_mn=x
function JZ_Set(m,n,x)
	local aa={}
	for ii=1,m do
		aa[ii]={}
		for jj=1,n do
			aa[ii][jj]=x
		end
	end
	return aa
end

-- ��λ��ֵ A_nn
function JZ_SetI(n)
	local aa={}
	for ii=1,n do
		aa[ii]={}
		for jj=1,n do
			aa[ii][jj]=0
		end
		aa[ii][ii]=1
	end
	return aa
end

-- ������Ӽ�, �п�ʼλ�ú�����ֹλ��, �п�ʼλ�ú�����ֹλ��
function JZ_Copy(JZ,rB,rE,cB,cE)
	cB=cB or 1;   cE=cE or #JZ[1]
	rB=rB or 1;   rE=rE or #JZ
	local aa={}
	for ii=rB,rE do
		aa[ii-rB+1]={}
		for jj=cB,cE do
			aa[ii-rB+1][jj-cB+1]=JZ[ii][jj]
		end
	end
	return aa
end

-- ���������
function JZ_CopyRow(JZ,...)
	local aa,nn={},select("#",...)
	for ii=1,nn do
		aa[#aa+1]=JZ[select(ii,...)]
	end
	return aa
end

-- ���������
function JZ_CopyCol(JZ,...)
	local aa,nn={},select("#",...)
	for ii=1,#JZ do
		aa[ii]={}
		for jj=1,nn do
			aa[ii][jj]=JZ[ii][select(jj,...)]
		end
	end
	return aa
end

-- ����������,��������, �п�ʼλ�ú�����ֹλ��, �п�ʼλ�ú�����ֹλ��
function JZ_SumR(JZ,rB,rE,cB,cE)
	cB=cB or 1;   cE=cE or #JZ[1]
	rB=rB or 1;   rE=rE or #JZ
	local aa={}
	for ii=rB,rE do
		aa[ii-rB+1]=0
		for jj=cB,cE do
			aa[ii-rB+1]=aa[ii-rB+1] + JZ[ii][jj]
		end
	end
	return aa
end

-- ����������,��������, �п�ʼλ�ú�����ֹλ��, �п�ʼλ�ú�����ֹλ��
function JZ_SumC(JZ,rB,rE,cB,cE)
	cB=cB or 1;   cE=cE or #JZ[1]
	rB=rB or 1;   rE=rE or #JZ
	local aa={}
	for jj=cB,cE do
		aa[jj-cB+1]=0
		for ii=rB,rE do
			aa[jj-cB+1]=aa[jj-cB+1] + JZ[ii][jj]
		end
	end
	return aa
end

-- ���������, �����к�֮��, ָ��������,���򷵻�ȫ���кͱ�,����(JZ,1,3,5)
function JZ_SumRow(JZ,...)
	local aa,nn={},select("#",...)
	if nn==0 then
		for ii=1,#JZ do
			aa[ii]=0
			for jj=1,#JZ[ii] do
				aa[ii]=aa[ii] + JZ[ii][jj]
			end
		end
	else
		for ii=1,nn do
			aa[ii]=0
			kk=select(ii,...)
			for jj=1,#JZ[kk] do
				aa[ii]=aa[ii] + JZ[kk][jj]
			end
		end
	end
	return aa
end

-- ���������, �����к�֮��, ָ��������,���򷵻�ȫ���кͱ�,����(JZ,2,4,6)
function JZ_SumCol(JZ,...)
	local aa,nn={},select("#",...)
	if nn==0 then
		for ii=1,#JZ do
			for jj=1,#JZ[ii] do
				aa[jj]=(aa[jj] or 0) + JZ[ii][jj]
			end
		end
	else
		for jj=1,nn do
			aa[jj]=0;   kk=select(jj,...)
			for ii=1,#JZ do
				aa[jj]=aa[jj] + JZ[ii][kk]
			end
		end
	end
	return aa
end

-- ����˷�, Ҫ��JZ1����������JZ2������
function JZ_ChengFa(JZ1,JZ2)
	if #JZ1[1]~=#JZ2 then return nil end
	local cc={}
	for ii=1,#JZ1 do
		cc[ii]={}
		for jj=1,#JZ2[1] do
			cc[ii][jj]=0
			for kk=1,#JZ2 do
				cc[ii][jj]=cc[ii][jj] + JZ1[ii][kk]*JZ2[kk][jj]
			end
		end
	end
	return cc
end

-- ����ķ���ͳ��
function JZ_FZCount(JZ,...)
	local bb,cc,nn={},{},select("#",...)
	local ss=""
	if nn==0 then
		for i=1,#JZ do
			ss=table.concat(JZ[i],"\t")
			if bb[ss]==nil then
				bb[ss]=1
				cc[#cc+1]=JZ[i]
			else
				bb[ss]=bb[ss]+1
			end
		end
	else  -- ��ά, ָ���м���
		for i=1,#JZ do
			local tt={}
			for j=1,nn do tt[#tt+1]=JZ[i][select(j,...)] end
			ss=table.concat(tt,"\t")
			if bb[ss]==nil then
				bb[ss]=1
				cc[#cc+1]=tt
			else
				bb[ss]=bb[ss]+1
			end
		end
	end
	table.sort(cc,function(a,b)
		for i=1,#a-1 do
			if a[i]~=b[i] then return a[i]<b[i] end
		end
		return a[#a]<=b[#b]
	end)
	for i=1,#cc do
		ss=table.concat(cc[i],"\t")
		cc[i][#cc[i]+1]=bb[ss]
	end
	return cc
end

-- ����ת��
function JZ_ZhuanZhi(JZ)
	local NewData={}
	for ii=1,#JZ do
		for jj=1,#JZ[ii] do
			if NewData[jj] == nil then NewData[jj]={} end
			NewData[jj][ii]=JZ[ii][jj]
		end
	end
	return NewData
end

-- ��þ����nCol�еķֶ�λ��
function JZ_DuanBiao(JZ,Duan,nCol)
	local Xu,Biao={},{}
	for i=1,#JZ do Xu[i]=JZ[i][nCol] end
	table.sort(Xu)
	for i=1,Duan-1 do Biao[i]=Xu[(#Xu*i-#Xu*i%Duan)/Duan] end
	return Biao
end

-- �ȱ任, ��ԭ�еľ���JZ��nCol������,����Biao�ķֶ�λ��,��ǳɶκ�
function JZ_DuanReSet(JZ,Biao,nCol)
	local kk=0
	for ii=1,#JZ do
		kk=#Biao+1
		for jj=1,#Biao do
			if JZ[ii][nCol]<=Biao[jj] then kk=jj; break end
		end
		JZ[ii][nCol]=kk
	end
end

-- �����λ��
function JZ_DuanWeiZhi(JZ,nCol)
	local bb,tt={},0
	bb[1]={1,0}
	tt=JZ[1][nCol]
	for ii=2,#JZ do
		if tt~=JZ[ii][nCol] then
			bb[#bb][2]=ii-1
			bb[#bb+1]={ii,0}
			tt=JZ[ii][nCol]
		end
	end
	bb[#bb][2]=#JZ
	return bb
end

-- �����nCol�����ֵλ��
function JZ_iMax(JZ,nCol)
	local kk=1
	for ii=2,#JZ do if JZ[kk][nCol]<JZ[ii][nCol] then kk=ii end end
	return kk
end

-- �����nCol�о���ֵ���ֵλ��
function JZ_iMaxAbs(JZ,nCol)
	local kk=1
	for ii=2,#JZ do if math.abs(JZ[kk][nCol])<math.abs(JZ[ii][nCol]) then kk=ii end end
	return kk
end

-- �����nCol����Сֵλ��
function JZ_iMin(JZ,nCol)
	local kk=1
	for ii=2,#JZ do if JZ[kk][nCol]>JZ[ii][nCol] then kk=ii end end
	return kk
end

-- �����nCol�о���ֵ��Сֵλ��
function JZ_iMinAbs(JZ,nCol)
	local kk=1
	for ii=2,#JZ do if math.abs(JZ[kk][nCol])>math.abs(JZ[ii][nCol]) then kk=ii end end
	return kk
end

-- ���������ʽ
function JZ_HLS(JZ)
	local nn=JZ_Copy(JZ)
	local jg=1
	for i=1,#nn do
		--�ҵ�ǰ���е������
		local k=i
		for j=i+1,#nn do
			if math.abs(nn[j][i])>math.abs(nn[k][i]) then k=j end
		end
		if i~=k then
			nn[i],nn[k]=nn[k],nn[i]	--����, �����
			jg=-jg
		end
		--��һ��
		if nn[i][i]==0 then return 0 end
		vv=nn[i][i]
		jg=jg*vv
		for j=i,#nn do nn[i][j]=nn[i][j]/vv end
		--������
		for ii=i+1,#nn do
			vv=nn[ii][i]
			for j=i,#nn do nn[ii][j]=nn[ii][j]-vv*nn[i][j] end
		end
	end
	return jg
end

-- �����
function JZ_Ni(JZ)
	-- �������ݵ�������
	local nn={}
	for i=1,#JZ do
		nn[i]={}
		for j=1,#JZ do nn[i][j]=JZ[i][j] end
		for j=1,#JZ do nn[i][j+#JZ]= (i==j and 1 or 0) end
	end
	-- ׷�Ϸ�
	for i=1,#nn do
		--�ҵ�ǰ���е������
		local k=i
		for j=i+1,#nn do
			if math.abs(JZ[j][i])>math.abs(JZ[k][i]) then k=j end
		end
		if i~=k then
			nn[i],nn[k]=nn[k],nn[i]	--����
		end
		--��һ��
		if nn[i][i]==0 then return nil end
		vv=nn[i][i]
		for j=i,#nn[i] do nn[i][j]=nn[i][j]/vv end
		--������
		for ii=i+1,#JZ do
			vv=nn[ii][i]
			for j=i,#nn[i] do nn[ii][j]=nn[ii][j]-vv*nn[i][j] end
		end
	end
	--���ϻ�����
	for i=#JZ,1,-1 do
		for ii=i-1,1,-1 do
			vv=nn[ii][i]
			for j=#JZ+1,#nn[i] do nn[ii][j]=nn[ii][j]-vv*nn[i][j] end
		end
	end
	--ת��
	local re={}
	for i=1,#JZ do
		re[i]={}
		for j=1,#JZ do re[i][j]=nn[i][j+#JZ] end
	end
	return re
end

-- �����SVD�ֽ�,JZ_{m,n}�ֽ�ΪU*W*V', ����U_{m,n},W_n,V'_{n,n}, WΪ����ֵ�Խ���, VΪ������
function JZ_SVD(JZ)
	local flag,i,its,j,jj,k,r,nm
	local anorm,c,f,g,h,s,scale,x,y,z,tt
	local m,n=#JZ,#JZ[1]
	local u=JZ_Copy(JZ)
	local v=JZ_Set(n,n,0)
	local w=XL_Set(n,0)
	local rv1=XL_Set(n,0)
	g,scale,anorm=0,0,0
	for i=1,n do
		r=i+2
		rv1[i]=scale*g;
		g,s,scale=0,0,0
		if i<=m then
			for k=i, m do
				scale = scale + math.abs(u[k][i])
			end
			if scale~=0 then
				for k=i,m do
					u[k][i] = u[k][i]/scale
					s = s + u[k][i]*u[k][i]
				end
				f=u[i][i]
				g=math.sqrt(s)
				g= f>=0 and -g or g
				h=f*g-s
				u[i][i]=f-g
				for j=r-1,n do
					s=0
					for k=i,m do
						s = s + u[k][i]*u[k][j]
					end
					f=s/h
					for k=i,m do u[k][j] = u[k][j] + f*u[k][i] end
				end
				for k=i,m do u[k][i] = u[k][i] * scale end
			end
		end
		w[i]=scale *g
		g,s,scale=0,0,0
		if i <= m and i ~= n then
			for k=r-1,n do scale = scale + math.abs(u[i][k]) end
			if scale~=0 then
				for k=r-1,n do
					u[i][k] = u[i][k]/scale
					s = s + u[i][k]*u[i][k]
				end
				f=u[i][r-1]
				g=math.sqrt(s)
				g= (f>=0 and -g or g)
				h=f*g-s
				u[i][r-1]=f-g
				for k=r-1, n do rv1[k]=u[i][k]/h end
				for j=r-1, m do
					s=0
					for k=r-1,n do s = s + u[j][k]*u[i][k] end
					for k=r-1,n do u[j][k] = u[j][k] + s*rv1[k] end
				end
				for k=r-1,n do u[i][k] = u[i][k]*scale end
			end
		end
		tt= math.abs(w[i]) + math.abs(rv1[i])
		if anorm<tt then anorm=tt end
	end
	for i=n,1,-1 do
		if i < n then
			if g~=0 then
				for j=r,n do v[j][i]=(u[i][j]/u[i][r])/g end
				for j=r,n do
					s=0
					for k=r,n do s = s + u[i][k]*v[k][j] end
					for k=r,n do v[k][j] = v[k][j] + s*v[k][i] end
				end
			end
			for j=r,n do v[i][j],v[j][i]=0,0 end
		end
		v[i][i]=1
		g=rv1[i]
		r=i
	end
	for i=(m>n and n or m),1,-1 do
		r=i+1
		g=w[i]
		for j=r,n do u[i][j]=0 end
		if g~=0 then
			g=1/g
			for j=r,n do
				s=0
				for k=r,m do s = s + u[k][i]*u[k][j] end
				f=(s/u[i][i])*g
				for k=i,m do u[k][j] = u[k][j] + f*u[k][i] end
			end
			for j=i,m do u[j][i] = u[j][i] * g end
		else
			for j=i,m do u[j][i]=0 end
		end
		u[i][i]=u[i][i]+1
	end
	for k=n,1,-1 do
		for its=1,30 do
			flag=1
			r=k
			while r>=1 do
				nm=r-1
				if math.abs(rv1[r])+anorm == anorm then
					flag=0
					break
				end
				if math.abs(w[nm])+anorm == anorm then
					break
				end
				r=r-1
			end
			if flag~=0 then
				c=0
				s=1
				for i=r-1,k do
					f=s*rv1[i]
					rv1[i]=c*rv1[i]
					if math.abs(f)+anorm == anorm then break end
					g=w[i]
					h=math.sqrt(f*f+g*g)
					w[i]=h
					h=1/h
					c=g*h
					s = -f*h
					for j=1,m do
						y=u[j][nm]
						z=u[j][i]
						u[j][nm]=y*c+z*s
						u[j][i]=z*c-y*s
					end
				end
			end
			z=w[k]
			if r == k then
				if z < 0 then
					w[k] = -z
					for j=1,n do v[j][k] = -v[j][k] end
				end
				break
			end
			if its==30 then print("no convergence in 30 svdcmp iterations") end
			x=w[r]
			nm=k-1
			y=w[nm]
			g=rv1[nm]
			h=rv1[k]
			f=((y-z)*(y+z)+(g-h)*(g+h))/(2*h*y)
			g=math.sqrt(f*f+1)
			f=((x-z)*(x+z)+h*((y/(f+(f>=0 and g or -g)))-h))/x
			c,s=1,1
			for j=r,nm do
				i=j+1
				g=rv1[i]
				y=w[i]
				h=s*g
				g=c*g
				z=math.sqrt(f*f+h*h)
				rv1[j]=z
				c=f/z
				s=h/z
				f=x*c+g*s
				g = g*c-x*s
				h=y*s
				y=y*c
				for jj=1,n do
					x=v[jj][j]
					z=v[jj][i]
					v[jj][j]=x*c+z*s
					v[jj][i]=z*c-x*s
				end
				z=math.sqrt(f*f+h*h)
				w[j]=z
				if z~=0 then
					z=1/z
					c=f*z
					s=h*z
				end
				f=c*g+s*y
				x=c*y-s*g
				for jj=1,m do
					y=u[jj][j]
					z=u[jj][i]
					u[jj][j]=y*c+z*s
					u[jj][i]=z*c-y*s
				end
			end
			rv1[r]=0
			rv1[k]=f
			w[k]=x
		end
	end
	return u,w,v
end

-- �������ݽ�����ʽ�洢, ��ÿһ�����ݵ�[0]�д洢���ݵļ�¼����, �ظ�����ɾ��.
function JZ_DataZip(JZ)
	local NewData,BZ={},{}
	for i=1,#JZ do
		local ss=table.concat(JZ[i],"\t")
		if BZ[ss]==nil then
			NewData[#NewData+1]=JZ[i]
			NewData[#NewData][0]=1
			BZ[ss]=#NewData
		else
			NewData[BZ[ss]][0]=NewData[BZ[ss]][0]+1
		end
	end
	return NewData
end

-- ���ֵ���Ϣ���������, ���px������Ա�����, pxΪ��������м���, ����{1}, Ԫ��������ʾ������.
function JZ_FromZD(ZD,px)
	local biao={}
	local flag=0   -- �ֵ��е������Ƿ��Ǳ�
	for k in pairs(ZD) do
		if type(ZD[k])=="table" then
			flag = ZD[k][1] and 6 or 2  -- ����6, �ֵ���2(�޷�����)
		elseif type(ZD[k])=="number" or type(ZD[k])=="string" then
			flag=7
		else
			flag=1 -- ��������������
		end
		break
	end
	if flag<=5 then return nil end
	if flag==6 then
		for k in pairs(ZD) do biao[#biao+1]={k,unpack(ZD[k])} end
	end
	if flag==7 then
		for k in pairs(ZD) do biao[#biao+1]={k,ZD[k]} end
	end
	if px then
		JZ_Sort(biao,px)
	end
	return biao
end

-- ��������, pxΪ��������м���, ����{1}, Ԫ��Ϊ����ʾ����, Ԫ��Ϊ��Ϊ����.
function JZ_Sort(JZ,px)
	if type(px)=="table" then
		table.sort(JZ,function (a,b)
			for ii=1,#px do
				if px[ii]>0 then
					if a[px[ii]]~=b[px[ii]] then return a[px[ii]]<b[px[ii]] end
				elseif px[ii]<0 then
					if a[-px[ii]]~=b[-px[ii]] then return a[-px[ii]]>b[-px[ii]] end
				end
			end
		end)
	else
		print("����:�ڶ����������Ǳ�!")
	end
end

--���������������,����Ϊ2147483648,��21��
function InitRand(speed)
	local x={speed%65536,0}
	return function ()
		x[2]=x[2]*45221+x[1]*4793
		x[1]=x[1]*45221+453806245
		x[2]=x[2]+(x[1]-x[1]%65536)/65536
		x[2]=x[2]%32768;  x[1]=x[1]%65536
		return (x[2]*65536+x[1])/2147483648
	end
end
Rand=InitRand(1)  --��ʼ�����������������������Ϊ���������

--��׼��̬�����������(-4,+4)
function RandNormal()
	local x,y=0,0
	while true do
		x=Rand()*8-4;	y=Rand()
		if y<math.exp(-x*x/2) then return x end
	end
end

--����Gamma����
function GL_LnGamma(xx)
	local ser=1.000000000190015+76.18009172947146/(xx+1.0)-86.50532032941677/(xx+2.0)+
		24.01409824083091/(xx+3.0)-1.231739572450155/(xx+4.0)+
		0.1208650973866179e-2/(xx+5.0)-0.5395239384953e-5/(xx+6.0)
	return (xx+0.5)*math.log(xx+5.5) - xx - 4.5810614667953278 + math.log(ser/xx)
end

--����ȫGamma����
function GL_gamma2x(a,x)
	local n,sum,del
	sum=1/a;  del=sum
	for n=1,100 do
		del = del * x/(a+n)
		sum = sum + del
		if del < sum*3.0e-7 then return sum*math.exp(-x+a*math.log(x)) end
	end
	return -1 -- �������, ��������Χ
end

--����ȫ��Gamma����
function GL_Gamma2d(a,x)
	local i,an,b,c,d,del,h
	b=x+1-a
	c=1/1.0e-30
	d=1/b
	h=d
	i=1
	while i<=100 do
		an=-i*(i-a)
		b= b+2
		d=an*d+b;  if (d>0 and d or -d) < 1e-30 then d=1e-30 end
		c=b+an/c;  if (c>0 and c or -c) < 1e-30 then c=1e-30 end
		d=1/d
		del=d*c
		h = h*del
		if (del>1.0 and del-1 or 1-del) < 3e-7 then break end
		i=i+1
	end
	if i>100 then return -1 end
	return math.exp(-x+a*math.log(x))*h
end

--����ȫGamma����P��ʽ
function GL_GammaP(a,x)
	local tmp
	if x<a+1 then
		tmp=GL_gamma2x(a,x)
		return tmp<0 and -1 or tmp/math.exp(GL_LnGamma(a))
	else
		tmp=GL_Gamma2d(a,x)
		return tmp<0 and -1 or 1-tmp/math.exp(GL_LnGamma(a))
	end
end

--����ȫ��������
function GL_Betacf(a,b,x)
	local m,m2,aa,c,d,del,h,qab,qam,qap
	qab=a+b
	qap=a+1
	qam=a-1
	c=1
	d=1-qab*x/qap
	if math.abs(d) < 1e-30 then d=1e-30 end
	d=1/d
	h=d
	m=1
	while m<=100 do
		m2=2*m;
		aa=m*(b-m)*x/((qam+m2)*(a+m2));
		d=1+aa*d;
		if math.abs(d) < 1e-30 then d=1e-30 end
		c=1+aa/c;
		if math.abs(c) < 1e-30 then c=1e-30 end
		d=1/d;
		h = h*d*c
		aa = -(a+m)*(qab+m)*x/((a+m2)*(qap+m2));
		d=1+aa*d;
		if math.abs(d) < 1e-30 then d=1e-30 end
		c=1+aa/c
		if math.abs(c) < 1e-30 then c=1e-30 end
		d=1/d
		del=d*c
		h = h*del
		if math.abs(del-1) < 3e-7 then break end
		m=m+1
	end
	if m>100 then return -1 end
	return h
end

--����I
function GL_Betai(a,b,x)
	local bt
	if x==0 or x==1 then
		bt=0
	else
		bt=math.exp(GL_LnGamma(a+b)-GL_LnGamma(a)-GL_LnGamma(b)+a*math.log(x)+b*math.log(1.0-x))
	end
	if x<(a+1)/(a+b+2) then
		return bt*GL_Betacf(a,b,x)/a
	else
		return 1-bt*GL_Betacf(b,a,1-x)/b
	end
end

--Beta�ֲ�
function GL_I(x,a,b)
	local i
	if a==0.5 and b==0.5 then i=1-2/pi*math.atan(((1-x)/x)^0.5)
	elseif a==0.5 and b==1 then i=x^0.5
	elseif a==1 and b==0.5 then i=1-(1-x)^0.5
	elseif a==1 and b==1 then i=x
	elseif a>=b then i=GL_I(x,a-1,b)-1/(a-1)*GL_U(x,a-1,b)
	else i=GL_I(x,a,b-1)+1/(b-1)*GL_U(x,a,b-1)
	end
	return i
end

--���ַ���ֵ
function GL_ef(y,n1,n2)
	local a,b,c,x
	a=0; b=1; c=0.0000000001;
	while math.abs(b-a)>=c do
		x=(a+b)/2;
		if (GL_I(x,n1,n2)-y)~=0 then
			if (GL_I(a,n1,n2)-y)*(GL_I(x,n1,n2)-y)<0 then b=x else a=x end
		else a=x; b=x; end
	end
	return (a+b)/2
end

--�ܶȺ���: ��׼��̬�ֲ�
--��ڲ���: ��׼��̬�������X��ȡֵx
--���ڲ���:��׼��̬�������XȡֵΪxʱ���ܶ�ֵ
function GL_NormP(x)
	return math.exp(-0.5*math.log(2*math.pi)-0.5*x*x)
end

--�ܶȺ���: �����ֲ�
--��ڲ���: �������X��ȡֵx�����ɶ�n
--���ڲ���:�������XȡֵΪxʱ�ĸ���ֵ
function GL_ChiSquareP(x,n)
	if x<0 then return 0 end
	return math.exp((0.5*n-1)*math.log(x)-0.5*x-0.5*n*math.log(2)-GL_LnGamma(0.5*n))
end

--�ܶȺ���:T�ֲ�,���ɶ�Ϊn
--��ڲ���:�������X��ȡֵt�����ɶ�n
--���ڲ���:�������XȡֵΪtʱ�ĸ���ֵ
function GL_TiDistP(t,n)
	return math.exp(GL_LnGamma(0.5*n+0.5)-0.5*(n+1)*math.log(1+t*t/n)-
		0.5*math.log(math.pi*n)-GL_LnGamma(0.5*n))
end

--�ܶȺ���: F�ֲ�,���ɶ�Ϊn1��n2
--��ڲ���: �������X��ȡֵf����һ���ɶ�n1���ڶ����ɶ�n2
--���ڲ���: �������XȡֵΪfʱ���ܶ�ֵ
function GL_FisherP(f,n1,n2)
	local tmp
	if f<=0 then return 0 end
	tmp=GL_LnGamma(0.5*(n1+n2))+0.5*n1*math.log(n1/n2)+(0.5*n1-1.0)*math.log(f)
	return math.exp(tmp-GL_LnGamma(0.5*n1)-GL_LnGamma(0.5*n2)-0.5*(n1+n2)*math.log(1.0+n1*f/n2))
end

--��λ��:��׼��̬�ֲ�,��Ч��Χ(-11,+11),��F^{-1}(Q)
--��ڲ���: �ϲ����
--���ڲ���: ��׼��̬�ֲ��ķ�λ��
function GL_NormalQ(Q)
	local p,y,z,i
	local bb={1.570796288,0.03706987906,-0.0008364353589,
		-0.0002250947176,0.000006841218299,0.000005824238515,
		-0.00000104527497,8.360937017E-08,-3.231081277E-09,
		3.657763036E-11,6.936233982E-13}
	if Q==0.5 then return 0 end
	if Q>0.9999999999 then Q=0.9999999999 end
	if 1-Q>0.9999999999 then Q=1-0.9999999999 end
	p= Q>0.5 and 1.0-Q or Q
	y=-math.log(4*p*(1-p))
	z=0
	for i=11,1,-1 do z=(z+bb[i])*y end
	if Q>0.5 then return -math.sqrt(z) end
	return math.sqrt(z)
end

--��λ��:T�ֲ�
function GL_StudentQ(q,n)
	local b
	if q<=0 or q>=1 then print("error\n"); exit(0); end
	if q==0.5 then return 0 end
	if q<0.5 then
		b=GL_ef(2*q,n*0.5,0.5)
		b=math.sqrt(n/b-n)
	else
		b=GL_ef(2*(1-q),n*0.5,0.5)
		b=-math.sqrt(n/b-n)
	end
	return b
end

--��λ��:F�ֲ�
function GL_U(x,a,b)
	local u
	if a==0.5 and b==0.5 then u=1/math.pi*(x*(1-x))^0.5
	elseif a==0.5 and b==1 then u=0.5*(x^0.5)*(1-x)
	elseif a==1 and b==0.5 then u=0.5*x*(1-x)^0.5
	elseif a==1 and b==1 then u=x*(1-x)
	elseif a>=b then u=(a+b-1)/(a-1)*x*GL_U(x,a-1,b)
	else u=(a+b-1)/(b-1)*(1-x)*GL_U(x,a,b-1)
	end
	return u
end

--��λ��:F�ֲ�
function GL_FisherQ(q,m,n)
	if q<=0 or q>=1 then print("error\n"); exit(0); end
	return n*GL_ef(1-q,m*0.5,n*0.5)/(m*(1-GL_ef(1-q,m*0.5,n*0.5)))
end

--�ֲ�����:����ֲ�
function GL_BinomialSum(k,n,p)
	return 1-GL_Betai(k+1,n-k,p)
end

--�ֲ�����:��׼��̬�ֲ�,��ȷ��С�����7λ
function GL_Normal7(x)
	local y,a,q
	y=0.707106781187*(x>0.0 and x or -x)
	a=0.0001520143+y*(0.0002765672+y*0.0000430638)
	a=0.0705230784+y*(0.0422820123+y*(0.0092705272+y*a))
	q=0.5*(1-math.exp(-16.0*(math.log(1+y*a))))
	return x<0.0 and 0.5-q or 0.5+q
end

--�ֲ�����:���ɷֲ�
function GL_PoissonSum(L,k)
	return 1-GL_GammaP(k,L)
end

--�ֲ�����:T�ֲ�
function GL_TdistSum(p,n)
	if p>0.0 then return 1.0-0.5*GL_Betai(n/2.0,0.5,n/(n+p*p)) end
	if p<0.0 then return 0.5*GL_Betai(n/2.0,0.5,n/(n+p*p)) end
	return(0.5);
end

--�ֲ�����:F�ֲ�
function GL_FisherSum(p,n1,n2)
	return 1.0-GL_Betai(n2/2.0,n1/2.0,n2/(n2+n1*p))
end

-- ��������ľ�ֵ����׼��, һά����, ԭʼ����(����Xi).
function GL_XL_JZFC(XL)
	if #XL==0 then return nil end
	local junzhi=XL_Sum(XL)/#XL
	local fc=0
	for ii=1,#XL do
		fc=fc+(XL[ii]-junzhi)^2
	end
	return junzhi,(fc/#XL)^0.5
end

-- ��������ľ�ֵ����׼��ܸ���, ��ά����, ԭʼ���ݵķ���ͳ������(����Xi,����)
function GL_JZ_JZFC(JZ)
	if #JZ==0 then return nil end
	local junzhi,count=0,0
	for ii=1,#JZ do
		junzhi=junzhi+JZ[ii][1]*JZ[ii][2]
		count=count+JZ[ii][2]
	end
	local junzhi=junzhi/count
	local fc=0
	for ii=1,#JZ do
		fc=fc+JZ[ii][2]*(JZ[ii][1]-junzhi)^2
	end
	return junzhi,(fc/count)^0.5,count
end

function GL_MoNi_LS(Px,xList)                     -- ��ɢ�ͷֲ���ģ��, ����:���ʱ�
	local nPX,Fx=#Px,{Px[1]}
	for i=2,nPX do Fx[i]=Fx[i-1]+Px[i] end
	local nFx=#Fx
	return function()
		local hh=Rand()
		for ii=1,nFx-1 do
			if hh<Fx[ii] then
				return xList and xList[ii] or ii
			end
		end
		return xList and xList[nPX] or nPX
	end
end

function GL_MoNi_LX(fx,x1,x2)               -- �����ͷֲ���ģ��, ����:�ܶȺ���
	return function()
		while true do
			local hh=Rand()*(x2-x1)+x1
			if Rand()<fx(hh) then
				return hh
			end
		end
	end
end

-- ������
function Int_nChaiFen(num) --ʮ�����������
	local aa,q={},math.abs(num)
	while q~=0 do
		aa[#aa+1]=q%10;  q=(q-q%10)/10
	end
	return aa
end

function Int_sChaiFen(str) --�����ַ�����ֲ�ת��Ϊ�������飬���ӵ�λ����λ��˳��洢
	local aa={}
	for i=1,#str do
		aa[#str-i+1]=str:byte(i,i)-48
	end
	return aa
end

function Int_ChengFa(p,q)  --�������˷� r=p*q, ���� p,q ��Ϊ����
	local aa={}
	for i=1,#q do
		for j=1,#p do
			aa[i+j-1]=(aa[i+j-1] or 0)+p[j]*q[i]
		end
	end
	local k=1
	while k<=#aa do
		if aa[k]>9 then
			aa[k+1]=(aa[k+1] or 0)+(aa[k]-aa[k]%10)/10
			aa[k]=aa[k]%10
		end
		k=k+1
	end
	return aa
end

-- ���Լ�� (a,b)=d
function Int_GongYueShu(a,b) -- ���Լ�� (a,b)=d
	a=a>0 and a or -a
	b=b>0 and b or -b -- �洢��ֵ
	while a>0 and b>0 do
		if a>b then a=a%b else b=b%a end
	end
	return a+b
end

-- ����������� ax+by=c, ����ϵ��a,b�ͳ�����c,��Ĵ洢�ռ�x,y
function Int_BDFangCheng(a,b,c) -- ax+by=c, ���ؽ�(x,y)
	local aa={}      -- շת��������м���
	local x,y,d,h,t  -- ���Լ��d, ������־h, ��ʱ����t
	aa[1]=a>0 and a or -a
	aa[2]=b>0 and b or -b  -- �洢��ֵ,Ȼ��Ӵ�С����
	h=aa[1]<aa[2] and 1 or 0 --��¼������
	if (h==1) then aa[1],aa[2]=aa[2],aa[1] end
	while aa[#aa]>0 do --��ջ��ջ, շת�����
		aa[#aa+1]=aa[#aa-1] % aa[#aa]
	end
	d=aa[#aa-1];  if c%d~=0 then return nil end   -- ��d|c������,���޽Ⲣ����
	x,y=1,0
	for i=#aa-1,2,-1 do -- ��ջ���������
		x,y=y,x-(aa[i-1]-aa[i-1]%aa[i])/aa[i]*y  -- ���ݵ��ƹ�ʽ����
	end
	if h==1 then x,y=y,x end -- ��齻�����
	if a<0 then x=-x end
	if b<0 then y=-y end -- ȷ����ķ���
	x=x*(c/d);  y=y*(c/d)  -- ���������ս��
	return x,y
end

-- ��������: ����, ��һ�����������ȫ����,����С�����˳�����,ÿ�β���һ��
-- ��ڲ���: �������������±�����,����Ԫ�ظ���
-- ���ڲ���: false:��������һ������, true:��������һ������
function Int_PaiLie_Init(xx,nn)
	local x=xx
	local n=nn
	local p,q,j,k=0,0,0,0
	if #x==0 then
		for i=1,n do x[i]=i end
	end
	return function ()
		p=0
		for i=n-1,1,-1 do
			if x[i]<x[i+1] then p=i; break end
		end
		if p==0 then return true end  -- ��������һ�����
		q=0
		for i=n,p+1,-1 do
			if x[p]<x[i] then q=i; break end
		end
		x[p],x[q]=x[q],x[p]
		j=p+1; k=n
		while j<k do
			x[j],x[k]=x[k],x[j]
			j=j+1; k=k-1
		end
		return false  --��һ����ϲ������
	end
end

--  ��������: ���, ��������,˳�������һ�����C_n^m
--  ��ڲ���: �±�����(��1��ʼ),Ԫ�ظ���n,�����m
--  ���ڲ���: false:��������һ�����, true:��������һ�����
function Int_ZuHe_Init(xx,nn,mm)
	local x=xx
	local n=nn
	local m=mm
	local k=0
	if #x==0 then
		for i=1,m do x[i]=i end
	end
	return function ()
		k=0
		for i=m,1,-1 do
			if x[i]+m-i<n then k=i; break end
		end
		if k==0 then return true end  -- ��������һ�����
		x[k]=x[k]+1
		for j=k+1,m do x[j]=x[j-1]+1 end
		return false  --��һ����ϲ������
	end
end

-- ���к�ת��Ϊ��Ӧ������,n�����ĵ�m����������,����(5,100),5����������,�ֵ����еĵ�100λ��
function Int_PaiLie_H2S(n, m)
	local xx,ss={},{}
	for i=1,n do xx[i]=i end
	m=m-1;  i=2
	while m>0 do
		ss[#ss+1]=m%i;  m=(m-m%i)/i;  i=i+1
	end
	if m<0 then return 1 end  -- m<1
	if #ss>n then return 2 end  -- m>n!
	for i=n-#ss,n-1 do
		p=ss[#ss];  ss[#ss]=nil;  q=xx[i+p]
		for j=i+p,i+1,-1 do xx[j]=xx[j-1] end
		xx[i]=q
	end
	return xx
end

-- ����ת��Ϊ��Ӧ�����к�,ĳһ��������51342, ��������ֵ����е�λ��
function Int_PaiLie_S2H(xx)
	local s,jc=0,1
	for i=#xx-1,1,-1 do
		jc=jc*(#xx-i)
		local t=0
		for j=i+1,#xx do
			if xx[i]>xx[j] then t=t+1 end
		end
		s=s+t*jc
	end
	return s+1
end

-- �ļ�����, chû��Ĭ��ֵ, (sFile):����ֲ���������, (sFile,ch):��ֲ���������
function File_Read(sFile,ch)
	local data={}
	local fp1=assert(io.open(sFile,"r"))
	local mm=""
	if ch==nil then
		while true do
			mm=fp1:read("*line")
			if mm==nil then break end
			if mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
			data[#data+1]=mm
		end
	else
		while true do
			mm=fp1:read("*line")
			if mm==nil then break end
			if mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
			if mm~="" then data[#data+1]=Split(mm,ch) end
		end
		mm=0  -- ĩ��Ϊȫ��ʱ, ɾ��ĩ��
		for ii=1,#data do
			if data[ii][#data[ii]]~="" then mm=ii; break end
		end
		if mm==0 then
			for ii=1,#data do data[ii][#data[ii]]=nil end
		end
	end
	fp1:close()
	return data
end

-- �ļ����벢ת��Ϊ��ֵ, (sFile):����ֲ�����������, (sFile,ch):��ֲ���������
function File_Read_n(sFile,ch,...)
	local data={}
	local fp1=assert(io.open(sFile,"r"))
	local mm,nn="",""
	if ch==nil then
		while true do
			mm=fp1:read("*line")
			if mm==nil then break end
			if mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
			if mm~="" then
				if Find(mm,"/") then
					nn=Split(mm,"/")
					data[#data+1]=tonumber(nn[1])/tonumber(nn[2])
				else
					data[#data+1]=tonumber(mm)
				end
			end
		end
	elseif select("#",...)==0 then
		while true do
			mm=fp1:read("*line")
			if mm==nil then break end
			if mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
			if mm~="" then
				data[#data+1]=Split(mm,ch)
				if data[#data][#data[#data]]=="" then data[#data][#data[#data]]=nil end --ĩ��Ϊ��ɾ��ĩ��
				for j=1,#data[#data] do
					if Find(data[#data][j],"/") then
						nn=Split(data[#data][j],"/")
						data[#data][j] = tonumber(nn[1])/tonumber(nn[2])
					else
						data[#data][j] = tonumber(data[#data][j])
					end
				end
			end
		end
	else
		while true do
			mm=fp1:read("*line")
			if mm==nil then break end
			if mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
			if mm~="" then
				data[#data+1]=Split(mm,ch)
				for j=1,select("#",...) do
					if Find(data[#data][select(j,...)],"/") then
						nn=Split(data[#data][select(j,...)],"/")
						data[#data][select(j,...)] = tonumber(nn[1])/tonumber(nn[2])
					else
						data[#data][select(j,...)] = tonumber(data[#data][select(j,...)])
					end
				end
			end
		end
	end
	fp1:close()
	return data
end

-- �ļ�ͳ��,��¼���ֶθ����б�
function File_CountField(sFile,ch)
	local list={}
	local fp1=assert(io.open(sFile,"r"))
	local mm=""
	while true do
		mm=fp1:read("*line")
		if mm==nil then break end
		if mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
		mm=Split(mm,ch)
		list[#mm]= (list[#mm] or 0) +1
	end
	fp1:close()
	for k in pairs(list) do print(k,list[k]) end
	return list
end

-- �ļ�ͳ��,��¼������(������)ȡֵ�����ͳ���б�
function File_CountColValue(sFile,ch)
	local list={}
	local fp1=assert(io.open(sFile,"r"))
	local mm=""
	while true do
		mm=fp1:read("*line")
		if mm==nil then break end
		if mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
		mm=Split(mm,"\t")
		for k=1,#mm do
			if list[k]==nil then list[k]={} end
			list[k][mm[k]]= (list[k][mm[k]] or 0) + 1
		end
	end
	fp1:close()
	print("col\tattrib\tnumber")  -- �к�\t����\t����
	for i=1,#list do
		mm=0
		for k in pairs(list[i]) do
			print(i,k,list[i][k])
			mm=mm+1
		end
		print(i.."*","count",mm)
	end
	return list
end

-- �������ӳ����ձ�, Ĭ��ch=\t,����:aa<tab>11<tab>22
function File_ReadCode(sFile,ch)
	local fp1=assert(io.open(sFile,"r"))
	local code={}
	local mm,nn=0,0
	ch=ch or "\t"
	while true do
		mm=fp1:read("*line")
		if mm==nil then break end
		if mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
		nn=Split(mm,ch)
		if #nn==1 then
			code[nn[1]]=true
		elseif #nn==2 then
			code[nn[1]]=nn[2]
		else
			code[nn[1]]={}
			for i=2,#nn do code[nn[1]][i-1]=nn[i] end
		end
	end
	fp1:close()
	return code
end

-- �������ӳ����ձ�, Ĭ��ch=\t,����:aa<tab>11<tab>22
function File_ReadCode_n(sFile,ch)
	local fp1=assert(io.open(sFile,"r"))
	local code={}
	local mm,nn=0,0
	ch=ch or "\t"
	while true do
		mm=fp1:read("*line")
		if mm==nil then break end
		if mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
		nn=Split(mm,ch)
		nn[1]=tonumber(nn[1])
		if #nn==1 then
			code[nn[1]]=true
		elseif #nn==2 then
			code[nn[1]]=nn[2]
		else
			code[nn[1]]={}
			for i=2,#nn do code[nn[1]][i-1]=nn[i] end
		end
	end
	fp1:close()
	return code
end

-- ��ʾ�ļ�ǰnNum������,nNum��ʾ��Ӧ����
function File_View(sFile,nNum)
	local fp1=assert(io.open(sFile,"r"))
	local oufpM,oufpK=FileName(sFile)  -- �����ļ�������չ��
	local fp2=assert(io.open(oufpM .. nNum .. "." .. oufpK,"w"))
	local mm=""
	while true do
		if nNum==0 then break end
		mm=fp1:read("*line")
		if mm==nil then break end
		fp2:write(mm,"\n")
		if nNum>0 then nNum=nNum-1 end
	end
	fp1:close()
	fp2:close()
end

-- ���ն�������ʾ�ļ�����,nNum=-1��ʾȫ��,������ʾ��Ӧ����
function File_View2(sFile,nNum)
	local fp1=assert(io.open(sFile,"rb"))
	local block,bytes=16,""
	while true do
		if nNum==0 then break end
		bytes=fp1:read(block)
		if bytes==nil then break end
		for _,b in ipairs{string.byte(bytes,1,-1)} do
			io.write(Bin8(b)," ")
		end
		io.write("\n")
		if nNum>0 then nNum=nNum-1 end
	end
end

-- ʮ��������ʾ�ļ�����,nNum=-1��ʾȫ��,������ʾ��Ӧ����
function File_View16(sFile,nNum)
	local fp1=assert(io.open(sFile,"rb"))
	local block,bytes=16,""
	while true do
		if nNum==0 then break end
		bytes=fp1:read(block)
		if bytes==nil then break end
		for _,b in ipairs{string.byte(bytes,1,-1)} do
			io.write(string.format("%02X ",b))
		end
		io.write(string.rep("  ",block-string.len(bytes)))
		io.write(" ",string.gsub(bytes,"%c","."),"\n")
		if nNum>0 then nNum=nNum-1 end
	end
end

-- �Ƚ��ļ�,�ҵ������ļ��Ĳ�֮ͬ��
function File_CompText(sFile1,sFile2)
	local fp1=assert(io.open(sFile1,"r"))
	local fp2=assert(io.open(sFile2,"r"))
	local ii,mm1,mm2=0,"",""
	while true do
		local mm1=fp1:read("*line")
		local mm2=fp2:read("*line")
		if mm1==nil and mm2==nil then break end
		ii=ii+1
		if mm1 ~= mm2 then
			print(ii,mm1)
			print(ii,mm2)
			break
		end
	end
	fp1:close()
	fp2:close()
end

-- SQL �ļ�ת��Ϊ Text �ļ�
function File_SQLToTxt(sqlFile,txtFile)
	local fp1=assert(io.open(sqlFile,"r"))
	local fp2=assert(io.open(txtFile,"w"))
	local mm,nn,i,j,ii,jj,fields
	while true do
		local mm=fp1:read("*line")
		if mm==nil then break end
		mm=Trim(mm)
		if mm~="" then
			nn=Split(mm,",")
			i,j=nn[1]:find(" ")
			if i==nil then i=#nn[1] end
			if nn[1]:sub(1,i-1)=="insert" then
				ii,jj=string.find(mm,"%(")
				if mm:sub(-1,-1)==")" then
					fields=mm:sub(ii+1,#mm-1)
				end
				fields=fields:gsub(", ",'	')
				break
			end
		end
	end
	fp2:write(fields,'\n')
	local count=0 -- ������
	local bb={}
	while true do
		mm=fp1:read("*line")
		if mm==nil then break end
		mm=Trim(mm)
		if mm~="" then
			if mm:sub(1,6)=="values" then
				if mm:sub(-2,-1)==");" then
					bb=SplitSQL(mm:sub(9,-3))
				end
				fp2:write(table.concat(bb,'	'),'\n')
				count=count+1  -- ����������
				if count%10000==0 then collectgarbage("collect") end  -- ��������
			end
		end
	end
	fp1:close()
	fp2:close()
end

-- Text �ļ�ת��Ϊ SQL �ļ�
function File_TxtToSQL(txtFile,sqlFile,sTable)
	local fp1=assert(io.open(txtFile,"r"))
	local fp2=assert(io.open(sqlFile,"w"))
	local mm=fp1:read("*line")  --�������ֶ����б�
	if mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
	local FD=Split(mm,"\t")
	local FDs="insert into " .. sTable .. "(" .. table.concat(FD,",") .. ")"
	while true do
		mm=fp1:read("*line")
		if mm==nil then break end
		if mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
		FD=Split(mm,"\t")
		fp2:write(FDs,"\n","values ('",table.concat(FD,"','"),"');","\n\n")
	end
	fp1:close()
	fp2:close()
end

function File_Date_Read(sFile)         -- �ļ�����Ϊ�����б�, ���������б��ֵ�
	local fp1=io.open(sFile,"r")
	local SaveList,mm={},""
	while true do
		mm=fp1:read("*line")
		if mm==nil then break end
		SaveList[mm]=true
	end
	fp1:close()
	return SaveList
end

function File_Date_Write(sFile,DateList)  -- ��д�ļ�, �����б��ֵ�д�뵽�ļ���, ���Ϊ�����ֵ�, ϵͳ�Զ�����, Ȼ��洢.
	local xList={}
	for k in pairs(DateList) do
		xList[#xList+1]=k
	end
	table.sort(xList)
	local fp1=io.open(sFile,"w")
	for i=1,#xList do
		fp1:write(xList[i],"\n")
	end
	fp1:close()
end

-- �ļ�ɾ����Ƶ��; �����ļ�,����ļ�,�ʿ�,��С��Ƶ
function File_Del_DiPinCi(inFile,ouFile,CiKu,nMin)
	local mm,ff,out
	-- ͳ��ÿһ���ִʵĳ���Ƶ��
	local List={}
	local fp1=assert(io.open(inFile,"r")) -- �ı������ļ�
	while true do
		mm=fp1:read("*line")
		if mm==nil then break end
		if mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
		mm=Str_DelAsciiChar(mm) --ɾ���Ǻ����ַ�
		ff=Str_NiX_FenCi(mm,CiKu) --����ִ�
		for i=1,#ff do
			List[ff[i]] = (List[ff[i]] or 0) + 1
		end
	end
	fp1:close()
	-- ���ǵ�Ƶ��д��
	local fp1=assert(io.open(inFile,"r")) -- �ı������ļ�
	local fp2=assert(io.open(ouFile,"w")) -- �ı������ļ�
	while true do
		mm=fp1:read("*line")
		if mm==nil then break end
		if mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
		mm=Str_DelAsciiChar(mm) --ɾ���Ǻ����ַ�
		ff=Str_NiX_FenCi(mm,CiKu) --����ִ�
		out={}
		for i=1,#ff do
			if List[ff[i]]>=nMin then out[#out+1]=ff[i] end
		end
		fp2:write(table.concat(out,"/"),"\n")
	end
	fp1:close()
	fp2:close()
end

-- ���ļ�����,nMaxΪ���ƺ���ļ��������,������ֵ�Ϳ������ļ�
function Files_Copy(inFiles,ouFile,nMax)
	local ReadLine=Files_Read(inFiles)  --��ʼ�����ļ���
	local WriteLine=Files_Write(ouFile,nMax)  --��ʼ�����ļ�д
	while true do
		local mm=ReadLine()
		if mm==nil then break end
		WriteLine(mm,1,"\n")
	end
	WriteLine("",-1) -- �ر��ļ�
end

-- ͳ���ļ��е�������
function Files_CountCol(inFiles,ch,ouFile)
	local ReadLine=Files_Read(inFiles)     -- ��ʼ���Ӷ��ļ���һ��
	local List={}
	ch=ch or "\t"
	while true do
		mm=ReadLine()
		if mm==nil then break end
		mm=Split(mm,ch)
		List[#mm]=(List[#mm] or 0) + 1
	end
	if ouFile then
		fp1=assert(io.open(ouFile,"w"))
		for k in pairs(List) do fp1:write(k,"\t",List[k],"\n") end
		fp1:close()
	else
		print("�ֶ���\t��������")
		for k in pairs(List) do print(k,List[k]) end
	end
end

-- ���ļ���¼���ķ���ͳ��
function Files_FZCount(inFiles,...)
	local bb,cc,nn={},{},select("#",...)
	local ReadLine=Files_Read(inFiles)  --��ʼ��
	local aa,ss=0,0
	if nn==0 then
		while true do
			aa=ReadLine()
			if aa==nil then break end
			ss=aa
			aa=Split(aa,"\t")
			if bb[ss]==nil then
				bb[ss]=1
				cc[#cc+1]={}
				for j=1,#aa do
					cc[#cc][j]=aa[j]
				end
			else
				bb[ss]=bb[ss]+1
			end
		end
	else  -- ��ά, ָ���м���
		while true do
			aa=ReadLine()
			if aa==nil then break end
			aa=Split(aa,"\t")
			ss=""..aa[select(1,...)]
			for j=2,nn do
				ss=ss .. "\t" .. aa[select(j,...)]
			end
			if bb[ss]==nil then
				bb[ss]=1
				cc[#cc+1]={}
				for j=1,nn do
					cc[#cc][j]=aa[select(j,...)]
				end
			else
				bb[ss]=bb[ss]+1
			end
		end
	end
	table.sort(cc,function(a,b)
		for i=1,#a-1 do
			if a[i]~=b[i] then return a[i]<b[i] end
		end
		return a[#a]<=b[#b]
	end)
	for i=1,#cc do
		ss=table.concat(cc[i],"\t")
		cc[i][#cc[i]+1]=bb[ss]
	end
	return cc
end

-- ��ȡ�ļ����е�ÿһ���ļ���ǰnNum����Ϣ��ouFile�л���ʾ����Ļ��
function Files_View(inFiles,nNum,ouFile)
	if ouFile==nil then
		for i=1,#inFiles do
			local iNum=nNum
			local fp1=assert(io.open(inFiles[i],"r"))
			local mm=""
			while true do
				if iNum==0 then break end
				mm=fp1:read("*line")
				if mm==nil then break end
				print(mm)
				if iNum>0 then iNum=iNum-1 end
			end
			fp1:close()
		end
	else
		local fp2=assert(io.open(ouFile,"w"))
		for i=1,#inFiles do
			local iNum=nNum
			local fp1=assert(io.open(inFiles[i],"r"))
			local mm=""
			while true do
				if iNum==0 then break end
				mm=fp1:read("*line")
				if mm==nil then break end
				fp2:write(mm,"\n")
				if iNum>0 then iNum=iNum-1 end
			end
			fp1:close()
		end
		fp2:close()
	end
end

-- �Ӷ��ļ���һ��,inFileΪ�����ļ�����
function Files_Read(inFiles)
	local iCur=1
	local infp=assert(io.open(inFiles[iCur],"r"))
	return function ()
		while true do
			local mm=infp:read("*line")
			if mm~=nil and mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
			if mm then return mm end -- ���ݴ���,��������
			infp:close() -- mm������ʱ��Ҫ��������һ���ļ�
			iCur=iCur+1
			if iCur>#inFiles then return nil end -- ȫ�����,���ؿ�
			infp=assert(io.open(inFiles[iCur],"r"))
		end
	end
end

-- �����ļ���д��һ�л����,ouFileΪ����ļ���,
-- ��nMax>0��nMaxΪ�����ÿһ���ļ��е����ټ�¼��.
-- ��nMax<0��ϵͳ�����һ���ļ���,���ļ�û���ļ����.
-- ��nMax=0��ϵͳ�����һ���ļ���,���ļ����ļ����1.
function Files_Write(ouFile,nMax)
	local iCur,oufp=0,nil
	local oufpM,oufpK=FileName(ouFile) -- �����ļ�������չ��
	local hcount=0
	if nMax<0 then
		oufp=assert(io.open(ouFile,"w"))
	end
	return function (sss,nn,ch)  -- ���ú����Լ�ȷ���Ƿ����Լ����еĸ���
		if nn==-1 then  -- �������,�ر��ļ�
			if oufp then oufp:close() end
			return iCur
		end
		if oufp==nil then
			iCur=iCur+1
			oufp=assert(io.open(oufpM .. "_" .. #tostring(iCur) .. iCur .. "." .. oufpK,"w"))
		end
		hcount=hcount+nn
		oufp:write(sss,ch or "")
		if nMax>0 and hcount>=nMax then  -- �Ƿ񿪱����ļ�
			hcount=0
			oufp:close()
			oufp=nil
		end
		return iCur
	end
end

-- ���ļ�����,�����ļ��б�,����ļ�����,�������,��ּ�¼��С,����ļ���¼��,�ָ���
function Files_Sort(inFiles,ouFile,px,inNum,OuNum,ch)
	local data={}
	local ReadLine=Files_Read(inFiles)     -- ��ʼ���Ӷ��ļ���һ��
	local oufpM,oufpK=FileName(ouFile)  -- �����ļ�������չ��
	local WriteLine=Files_Write(oufpM .. "_temp" .. "." .. oufpK,1)  -- ��ʼ�����ļ�(�ļ���,����¼��)
	ch=ch or "\t"
	local mm=""
	while true do
		mm=ReadLine()
		if mm then data[#data+1]=Split(mm,ch) end
		if (inNum>0 and #data>=inNum) or mm==nil then
			table.sort(data,px)
			for i=1,#data do
				WriteLine(table.concat(data[i],ch),0,"\n")
			end
			WriteLine("",1)
			data=nil
            collectgarbage("collect")
			data={}
		end
		if mm==nil then break end
	end
	local nOut=WriteLine("",-1)
	local inFiless={}
	for ii=1,nOut do
		inFiless[ii]=oufpM .. "_temp_" .. #tostring(ii) .. ii .. "." .. oufpK
	end
	Files_SortGB(inFiless,ouFile,px,OuNum,ch)
	--ɾ����ʱ�ļ�
	for ii=1,nOut do os.execute("del " .. inFiless[ii]) end
end

-- ���ļ�����������,�����ļ��б�,����ļ��б�,�������,ԭ�ָ���,�·ָ���
function Files_Sorts(inFiles,ouFiles,px,ch1,ch2)
	local data,fp1,fp2,mm={},0,0,0
	ch1=ch1 or "\t";	ch2=ch2 or ch1
	for ii=1,#inFiles do
		fp1=assert(io.open(inFiles[ii],"r"))
		fp2=assert(io.open(ouFiles[ii],"w"))
		while true do
			mm=fp1:read("*line")
			if mm==nil then break end
			data[#data+1]=Split(mm,ch1)
		end
		table.sort(data,px)
		for i=1,#data do
			fp2:write(table.concat(data[i],ch2),"\n")
		end
		data=nil
		collectgarbage("collect")
		data={}
		fp1:close()
		fp2:close()
	end
end

-- ��·�鲢����,�����ļ��б�,����ļ�����,�������,����ļ���¼��,�ָ���
function Files_SortGB(inFiles,ouFile,px,OuNum,ch)
	local data={}
	local flag={}  -- ��־�Ƿ��Ѿ�������
	local fp={}    -- �ļ�ָ���б�
	local mm=""
	ch=ch or "\t"
	-- ����ÿһ���ļ��ĵ�һ������
	for ii=1,#inFiles do
		fp[ii]=assert(io.open(inFiles[ii],"r"))
		mm=fp[ii]:read("*line")
		if mm~=nil and mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
		if mm then
			data[ii]=Split(mm,ch)
			flag[#flag+1]=ii
			for j=#flag,2,-1 do
				if px(data[flag[j-1]],data[flag[j]]) then  -- ǰС���ͻ���
					flag[j-1],flag[j]=flag[j],flag[j-1]
				else
					break
				end
			end
		end
	end
	-- ʹ�ö�·�鲢���򣬾ֲ����ò�������
	-- flag �е���Ϣ���մӴ�С������
	local WriteLine=Files_Write(ouFile,OuNum)  -- ��ʼ�����ļ�(�ļ���,����¼��)
	local count=0
	local kCount=#flag
	local ii=0
	while kCount>0 do    -- ÿ��������һ��
		ii=flag[kCount]
		WriteLine(table.concat(data[ii],ch),1,"\n")
		mm=fp[ii]:read("*line")
		if mm~=nil and mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
		if mm then
			data[ii]=Split(mm,ch)
			for j=kCount,2,-1 do
				if px(data[flag[j-1]],data[flag[j]]) then  -- ǰС���ͻ���
					flag[j-1],flag[j]=flag[j],flag[j-1]
				else
					break
				end
			end
		else
			kCount=kCount-1
		end
	end
	WriteLine("",-1)
	for ii=1,#inFiles do fp[ii]:close() end
end

-- ��·�鲢����,�����ļ��б���,����ļ�����,�������,����ļ���¼��,�ָ���
function Files_SortGBF(inFilesF,ouFile,px,OuNum,ch)
	local data={}
	local flag={}  -- ��־�Ƿ��Ѿ�������
	local mm=""
	ch=ch or "\t"
	-- ����ÿһ���ļ��ĵ�һ������
	for ii=1,#inFilesF do
		mm=inFilesF[ii]()
		if mm~=nil and mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
		if mm then
			data[ii]=Split(mm,ch)
			flag[#flag+1]=ii
			for j=#flag,2,-1 do
				if px(data[flag[j-1]],data[flag[j]]) then  -- ǰС���ͻ���
					flag[j-1],flag[j]=flag[j],flag[j-1]
				else
					break
				end
			end
		end
	end
	-- ʹ�ö�·�鲢���򣬾ֲ����ò�������
	-- flag �е���Ϣ���մӴ�С������
	local WriteLine=Files_Write(ouFile,OuNum)  -- ��ʼ�����ļ�(�ļ���,����¼��)
	local count=0
	local kCount=#flag
	local ii=0
	while kCount>0 do    -- ÿ��������һ��
		ii=flag[kCount]
		WriteLine(table.concat(data[ii],ch),1,"\n")
		mm=inFilesF[ii]()
		if mm~=nil and mm:sub(-1,-1)==string.char(13) then mm=mm:sub(1,-2) end
		if mm then
			data[ii]=Split(mm,ch)
			for j=kCount,2,-1 do
				if px(data[flag[j-1]],data[flag[j]]) then  -- ǰС���ͻ���
					flag[j-1],flag[j]=flag[j],flag[j-1]
				else
					break
				end
			end
		else
			kCount=kCount-1
		end
	end
	WriteLine("",-1)
end

-- �������������Ϣ
function Files_OutErrLine(inFiles,ch,num,ouFile)
	local ReadLine=Files_Read(inFiles)     -- ��ʼ���Ӷ��ļ���һ��
	local List={}
	local kk=0
	if ouFile then
		local WriteLine=Files_Write(ouFile,-1)  -- ��ʼ�����ļ�(�ļ���,����¼��)
		while true do
			local mm=ReadLine()
			if mm==nil then break end
			local nn=Split(mm,ch)
			if #nn~=num then WriteLine(mm,1,"\n") end
		end
		WriteLine("",-1)
	else
		while true do
			local mm=ReadLine()
			if mm==nil then break end
			kk=kk+1
			local nn=Split(mm,ch)
			if #nn~=num then print(kk,mm) end
		end
	end
end

-- �����ȷ����
function Files_OutTrueLine(inFiles,xzFiles,ch,num,ouFile)
	local ReadLine1=Files_Read(inFiles)     -- ��ʼ���Ӷ��ļ���һ��
	local ReadLine2=Files_Read(xzFiles)     -- ��ʼ���Ӷ��ļ���һ��
	local WriteLine=Files_Write(ouFile,-1)  -- ��ʼ�����ļ�(�ļ���,����¼��)
	local List={}
	while true do
		local mm=ReadLine1()
		if mm==nil then break end
		local nn=Split(mm,ch)
		if #nn==num then
			WriteLine(mm,1,"\n")
		else
			mm=ReadLine2()
			if #mm>0 then WriteLine(mm,1,"\n") end
		end
	end
	WriteLine("",-1)
end

-- ����ļ����µ�ȫ���ļ��б�
function Files_ListDir(sPath)
	os.execute("dir " .. sPath .. "/s/o >HLZtemp1.txt")
	local fp1=assert(io.open("HLZtemp1.txt","r"))
	local fp2=assert(io.open("HLZtemp2.txt","w"))
	local ss=" ��Ŀ¼"
	local path=""
	while true do
		local mm=fp1:read("*line")
		if mm==nil then break end
		if mm:sub(1,1) == " " then
			if mm:sub(3,3) == ":" then
				path = mm:sub(2,-#ss-1)
			end
		elseif mm~="" and mm:sub(22,26) ~= "<DIR>" then
			mm=mm:sub(37)
			if mm ~= "." and mm ~= ".." and mm ~= "HLZtemp1.txt" and mm ~= "HLZtemp2.txt" then
				fp2:write(path,"\\",mm,"\n")
			end
		end
	end
	fp1:close()
	fp2:close()
	os.execute("del HLZtemp1.txt")
end

-- �����ļ��б��е��ض��ַ���,�����ִ�Сд
function Files_FindTxt(sss)
	local sF=string.upper(sss)  -- ���������ַ���
	local sFS=sF:sub(1,1) -- ���������ַ�������ĸ
	local block,js=64,""  -- ���С, ���
	local nLen,nCRLF,nOffset="",0,1,0  -- λ��,�к�,�к�
	local fp1=assert(io.open("HLZtemp2.txt","r"))
	while true do
		local mm=fp1:read("*line")
		if mm==nil then break end
		if mm ~= "" then
			local fp2=assert(io.open(mm,"rb"))
			js,nLen,nCRLF,nOffset="",0,1,0
			while true do
				local ss=fp2:read(block)
				if ss==nil then break end
				js=js .. ss -- ����Ҫ��ʾԭ��,���Բ���ֱ�Ӵ�дת��
				for i=1,#js do
					nLen=nLen+1
					if js:sub(i,i)=="\n" then nCRLF=nCRLF+1; nOffset=0; else nOffset=nOffset+1 end
					if string.upper(js:sub(i,i))==sFS then
						if i+#sF-1<=#js then
							if string.upper(js:sub(i,i+#sF-1))==sF then
								if mm~="" then print("==========",mm); mm="" end
								print("----- λ��:"..nLen..", �к�:"..nCRLF..", �к�:"..nOffset)
								print(js)
							end
						else
							js=js:sub(i)
							break
						end
					end
					if i==#js then js=""; break end
				end
			end
			fp2:close()
		end
	end
	fp1:close()
end

-- �����ļ��б��е��ض��ַ���,���ִ�Сд
function Files_FindBin(sss)
	local sF=sss
	local sFS=sF:sub(1,1) -- ���������ַ�������ĸ
	local block,js=64,""  -- ���С, ���
	local nLen,nCRLF,nOffset="",0,1,0  -- λ��,�к�,�к�
	local fp1=assert(io.open("HLZtemp2.txt","r"))
	while true do
		local mm=fp1:read("*line")
		if mm==nil then break end
		if mm ~= "" then
			local fp2=assert(io.open(mm,"rb"))
			js,nLen,nCRLF,nOffset="",0,1,0
			while true do
				local ss=fp2:read(block)
				if ss==nil then break end
				js=js .. ss
				for i=1,#js do
					nLen=nLen+1
					if js:sub(i,i)=="\n" then nCRLF=nCRLF+1; nOffset=0; else nOffset=nOffset+1 end
					if js:sub(i,i)==sFS then
						if i+#sF-1<=#js then
							if js:sub(i,i+#sF-1)==sF then
								if mm~="" then print("==========",mm); mm="" end
								print("----- λ��:"..nLen..", �к�:"..nCRLF..", �к�:"..nOffset)
								print(js)
							end
						else
							js=js:sub(i)
							break
						end
					end
					if i==#js then js=""; break end
				end
			end
			fp2:close()
		end
	end
	fp1:close()
end

-- �ж��Ƿ�������
function Date_RN(Nian)
	return (Nian%400==0 or (Nian%100~=0 and Nian%4==0)) and 1 or 0
end

-- ת��Ϊ��������:��,��,��
function Date_t(nsDate)
	if type(nsDate)=="string" then
		local k=nsDate:sub(5,5)
		if k=="-" then
			local kk=Split(nsDate,k)
			return kk[1]+0,kk[2]+0,kk[3]+0, 1
		elseif k=="." then
			local kk=Split(nsDate,k)
			return kk[1]+0,kk[2]+0,kk[3]+0, 2
		else
			return nsDate:sub(1,4)+0, nsDate:sub(5,6)+0, nsDate:sub(7,8)+0, 3
		end
	elseif type(nsDate)=="table" then
		return nsDate[1],nsDate[2],nsDate[3], 4
	elseif type(nsDate)=="number" then
		local kk=nsDate..""
		return kk:sub(1,4)+0, kk:sub(5,6)+0, kk:sub(7,8)+0, 5
	else
		return nil
	end
end

-- ���ַ���������ת��Ϊ��ֵ������,��1986-01-01ת��Ϊ19860101
function Date_n(nsDate)
	local yy,mm,dd=Date_t(nsDate)
	return yy*10000+mm*100+dd
end

-- ����ֵ������ת��Ϊ�ַ���������,��19860101ת��Ϊ1986-01-01
function Date_s(nsDate)
	local yy,mm,dd=Date_t(nsDate)
	local kk=(yy*10000+mm*100+dd) ..""
	return kk:sub(1,4) .. "-" .. kk:sub(5,6) .. "-" .. kk:sub(7,8)
end

-- �����ַ�������֮������,1900�굽2099��, ���� 2005-10-03, 2006-01-04
function Date_sub(nsDate1,nsDate2)
	local y1,m1,d1=Date_t(nsDate1)
	local y2,m2,d2=Date_t(nsDate2)
	local day={0,31,59,90,120,151,181,212,243,273,304,334}
	local x1=(y1-1900)*365+((y1-1900)-(y1-1900)%4)/4+day[m1]+d1+(m1<=2 and -Date_RN(y1) or 0)
	local x2=(y2-1900)*365+((y2-1900)-(y2-1900)%4)/4+day[m2]+d2+(m2<=2 and -Date_RN(y2) or 0)
	return  x2-x1
end

-- ��ǰ����, ����������
function Date_Add(nsDate,ndd,nmm,nyy)
	local yy,mm,dd,nType = Date_t(nsDate)
	local day={31,28,31,30,31,30,31,31,30,31,30,31}
	yy=yy+(nyy or 0)
	mm=mm+(nmm or 0)
	while mm>=13 do yy=yy+1; mm=mm-12 end
	while mm<=0 do yy=yy-1; mm=mm+12 end
	day[2]=28+Date_RN(yy)
	if day[mm]<dd then dd=day[mm] end
	dd=dd+ndd
	while true do -- �����ϳ���
		if dd<=day[mm] then break end
		dd=dd-day[mm];  mm=mm+1
		if mm>12 then yy=yy+1; mm=mm-12; day[2]=28+Date_RN(yy) end
	end
	while true do -- �����³���
		if dd>=1 then break end
		mm=mm-1
		if mm<=0 then yy=yy-1; mm=mm+12; day[2]=28+Date_RN(yy) end
		dd=dd+day[mm]
	end
	local ss=tostring(yy*10000+mm*100+dd)
	if nType==1 then return ss:sub(1,4).."-"..ss:sub(5,6).."-"..ss:sub(7,8) end
	if nType==2 then return ss:sub(1,4).."."..ss:sub(5,6).."."..ss:sub(7,8) end
	if nType==3 then return ss end
	if nType==4 then return {tonumber(ss:sub(1,4)),tonumber(ss:sub(5,6)),tonumber(ss:sub(7,8))} end
	if nType==5 then return tonumber(ss) end
end

-- ��������,0:������,1:����һ,...,6:������
function Date_XQ(nsDate)
	local day={0,31,59,90,120,151,181,212,243,273,304,334}
	local yy,mm,dd=	Date_t(nsDate)
	local nSum=(yy-1900)*365+((yy-1900)-(yy-1900)%4)/4+day[mm]+dd+(mm<=2 and -Date_RN(yy) or 0)
	return nSum%7
end

-- �ж�������, ������:������,��:��Ϣ��
function Date_GZR(nsDate)
	local xq=Date_XQ(nsDate)
	if xq==0 or xq==6 then return 0 end
	return 1
end

-- �����������
function Date_ZhSh(nsDate)
	local xq=Date_XQ(nsDate)
	return Date_Add(nsDate,-xq)
end

-- ��ǰʱ�����n��, ��ǰʱ��Ϊ: 2015-01-01 00:00:00
function DateTime_Add(DateTime,n)
	local tt=Split(DateTime," ")
	local ndate=Date_s(tt[1])
	local hh,mm,ss=unpack(ToNumber(Split(tt[2],":")))
	ss=ss+n
	mm=mm+(ss-ss%60)/60
	hh=hh+(mm-mm%60)/60
	local dd=(hh-hh%24)/24
	if dd>0 then ndate=Date_Add(ndate,dd) end
	ss,mm,hh=ss%60,mm%60,hh%24
	return ndate .. " " .. string.format("%02d:%02d:%02d",hh,mm,ss)
end

-- �����ַ���ʱ��֮������,���� 2015-01-01 08:09:10, 2015-01-02 18:12:10
function DateTime_sub(DateTime1,DateTime2)
	local DT1,DT2=DateTime_Add(DateTime1,0),DateTime_Add(DateTime2,0) -- ��׼��
	if DT1>DT2 then DT1,DT2=DT2,DT1 end  -- ��֤С��ʱ����ǰ, ���ʱ���ں�
	local rqcha,pp,qq,kk
	rqcha=0
	if DT1:sub(1,10)~=DT2:sub(2,10) then rqcha=Date_sub(DT1:sub(1,10),DT2:sub(1,10))*24*60*60 end
	pp,qq=ToNumber(Split(DT1:sub(12,-1),":")),ToNumber(Split(DT2:sub(12,-1),":"))
	kk=(qq[1]-pp[1])*3600+(qq[2]-pp[2])*60+qq[3]-pp[3]
	return rqcha+kk
end

-- ɾ������Ascii�ַ�, ��������ͨ�ĺ����ַ�
function Str_DelAsciiChar(ss)
	if SysOpt[1]=="GBK" then
		return Str_DelAsciiChar_GBK(ss)
	elseif SysOpt[1]=="UTF8" then
		return Str_DelAsciiChar_UTF8(ss)
	else
		return ""
	end
end

-- ɾ������GBK�����ַ�, ɾ��Ascii�ַ�, ��������ͨ�ĺ����ַ�
function Str_DelAsciiChar_GBK(ss)
	local i,sFlag,DLine=1,0,{}
	local ch1,ch2,nFlag="","",0
	while i<#ss do
		ch1=string.byte(ss:sub(i,i))
		ch2=string.byte(ss:sub(i+1,i+1))
		if ch1<0x81 or ch1==0xff or ch2<0x40 or ch2==0x7f or ch2==0xff then
			i=i+1;  sFlag=1
		else
			nFlag=0;  --��ʱ ���뺺������, ���濪ʼ�����Ƿ��Ǳ����ŵ�
			if ch1<=0xa0 then nFlag=1 end
			if ch1>=0xaa and ch1<=0xaf and ch2>=0x40 and ch2<=0xa0 then nFlag=1 end
			if ch1>=0xb0 and ch1<=0xf7 then nFlag=1 end
			if ch1>=0xf8 and ch1<=0xfe and ch2>=0x40 and ch2<=0xa0 then nFlag=1 end
			if ch1==0xd7 and ch2>=0xfa and ch2<=0xfe then nFlag=0 end  --�⼸��λ��û�ж��庺��
			if nFlag==1 then  --�Ǻ�����Ҫ����, �������ǰ��ո�(��k>=0ʵ��)
				if #DLine>0 and sFlag==1 then
					DLine[#DLine+1]=" " --����һ���ո�,��Ϊ�ָ���
				end
				DLine[#DLine+1]=string.char(ch1) .. string.char(ch2)
				sFlag=0
			else
				sFlag=1
			end
			i=i+2
		end
	end
	return table.concat(DLine)
end

-- ɾ������GBK�����ַ�, ɾ��Ascii�ַ�, ��������ͨ�ĺ����ַ�
function Str_DelAsciiChar_UTF8(str)
	local sFlag,DLine,kk=0,{},0
	local res,bytes,ss,tt,mm={},{},"","",0
	for i=1,#str,1024 do
		bytes=str:sub(i,i+1023)
		ss={string.byte(bytes,1,-1)}
		for ii=1,#ss do
			tt=tt..bytes:sub(ii,ii)
			if ss[ii]<=127 then --ֱ��д��
				mm=ss[ii];  kk=0
			elseif (ss[ii]-ss[ii]%64)/64==3 then --����
				if (ss[ii]-ss[ii]%32)/32==6 then
					mm=ss[ii]%32;  kk=1
				elseif (ss[ii]-ss[ii]%16)/16==14 then
					mm=ss[ii]%16;  kk=2
				elseif (ss[ii]-ss[ii]%8)/8==30 then
					mm=ss[ii]%8;   kk=3
				elseif (ss[ii]-ss[ii]%4)/4==62 then
					mm=ss[ii]%4;   kk=4
				elseif (ss[ii]-ss[ii]%2)/2==126 then
					mm=ss[ii]%2;   kk=5
				else -- ss[ii]==254 or 255
					kk=-1
				end
			elseif (ss[ii]-ss[ii]%64)/64==2 then --����
				mm=mm*64+ss[ii]%64;  kk=kk-1
			end
			if kk==0 then
				if mm>=0x4E00 and mm<=0x9FA5 then	-- ��CJK-A���� 20901
					if #DLine>0 and sFlag==1 then DLine[#DLine+1]=" " end --����һ���ո�,��Ϊ�ָ���
					DLine[#DLine+1]=tt
					sFlag=0
				else
					sFlag=1
				end
				tt=""
			elseif kk<0 then
				kk=0
			end
		end
	end
	return table.concat(DLine)
end

-- ����ַ������Ƿ�ȫΪCJK-A����, ȫ������:true, û��:false,�����ڷ�CJKA����
function Str_Test_CJKA_All(str)
	local sFlag,DLine=0,{}
	local res,bytes,ss,mm,kk={},{},"",0,0
	for i=1,#str,1024 do
		bytes=str:sub(i,i+1023)
		ss={string.byte(bytes,1,-1)}
		for ii=1,#ss do
			if ss[ii]<=127 then --ֱ��д��
				mm=ss[ii];  kk=0
			elseif (ss[ii]-ss[ii]%64)/64==3 then --����
				if (ss[ii]-ss[ii]%32)/32==6 then
					mm=ss[ii]%32;  kk=1
				elseif (ss[ii]-ss[ii]%16)/16==14 then
					mm=ss[ii]%16;  kk=2
				elseif (ss[ii]-ss[ii]%8)/8==30 then
					mm=ss[ii]%8;   kk=3
				elseif (ss[ii]-ss[ii]%4)/4==62 then
					mm=ss[ii]%4;   kk=4
				elseif (ss[ii]-ss[ii]%2)/2==126 then
					mm=ss[ii]%2;   kk=5
				end
			elseif (ss[ii]-ss[ii]%64)/64==2 then --����
				mm=mm*64+ss[ii]%64;  kk=kk-1
			end
			if kk==0 then
				if mm<0x4E00 or mm>0x9FA5 then	-- ��CJK-A���� 20901
					return false
				end
			end
		end
	end
	if kk>0 then return false end  -- ���ڲ�ȱ����
	return true
end

-- �ı��ַ�������ִ�; �ı���, �ʿ�
function Str_NiX_FenCi(mm,CiKu)
	local DLine=Split(mm," ")
	local Doc,ss,ii,word,zLiang={},"",0,"",2
	if SysOpt[1]=="UTF8" then zLiang=3 end    -- ϵͳ����
	for i=#DLine,1,-1 do
		ss=DLine[i]
		while #ss>0 do    -- �������ƥ��ִʷ�
			for chd=CiKu["#"],zLiang,-zLiang do
				ii=#ss-chd+1
				if ii==1 then
					if CiKu[ss] then Doc[#Doc+1]=ss; ss=""; break end
				elseif ii>1 then
					word=ss:sub(ii)
					if chd==zLiang then
						Doc[#Doc+1]=word; ss=ss:sub(1,ii-1); break
					elseif CiKu[word] then
						Doc[#Doc+1]=word; ss=ss:sub(1,ii-1); break
					end
				end
			end
		end
	end
	local DocLine={} -- ����
	for i=#Doc,1,-1 do
		DocLine[#DocLine+1]=Doc[i]
	end
	return DocLine
end

-- �ı��ַ�������ִ�; �ı���, �ʿ�
function Str_ZhX_FenCi(mm,CiKu)
	local DLine=Split(mm," ")
	local Doc,ss,ii,word,zLiang,flag={},"",0,"",2,0
	if SysOpt[1]=="UTF8" then zLiang=3 end    -- ϵͳ����
	for i=1,#DLine do
		ss=DLine[i]
		while #ss>0 do    -- �������ƥ��ִʷ�
			flag=0
			for chd=CiKu["#"],zLiang+1,-zLiang do
				if CiKu[ss:sub(1,chd)] then
					Doc[#Doc+1]=ss:sub(1,chd);
					ss=ss:sub(chd+1,-1)
					flag=1
					break
				end
			end
			if flag==0 then
				Doc[#Doc+1]=ss:sub(1,zLiang);
				if #ss>zLiang then ss=ss:sub(zLiang+1,-1) else ss="" end
			end
		end
	end
	return Doc
end

-- �ı��ַ�������ִ�; �ı���, �ʿ�, ����Ҳ���, ����UTF8�ַ�����
function Str_ZhX_FenCi1(mm,CiKu)
	local DLine=XL_UTF8(mm)
	local k,Doc=1,{}
	local nn,rr=CiKu["##"],#DLine
	while k<=rr do
		local xmin=nn-1<=rr-k and nn-1 or rr-k
		for chd=xmin,0,-1 do
			local ss=table.concat(DLine,"",k,k+chd)
			if chd==0 or CiKu[ss] then
				Doc[#Doc+1]=ss
				k=k+chd+1
				break
			end
		end
	end
	return Doc
end

-- �ı��ַ�������ִ�; �ı���, �ʿ�, ���ֲ����, ����UTF8�ַ�����
function Str_ZhX_FenCi2(mm,CiKu)
	local DLine=XL_UTF8(mm)
	local k,Doc=1,{}
	local nn,rr=CiKu["##"],#DLine
	while k<rr do
		local xmin=nn-1<=rr-k and nn-1 or rr-k
		for chd=xmin,1,-1 do
			local ss=table.concat(DLine,"",k,k+chd)
			if CiKu[ss] then
				Doc[#Doc+1]=ss
				k=k+chd
				break
			end
		end
		k=k+1
	end
	return Doc
end

-- �ı�����������ʾ, tStr:���������ʱ�,tTZC:�ʿ��(һά��ͨ�ʴ�����)
function Str_TxtToXiangLiang(tStr,tTZC)
	local sLine,XL={},{}
	for ii=1,#tStr do sLine[tStr[ii]]=1 end
	for ii=1,#tTZC do XL[ii]=sLine[tTZC[ii]] or 0 end
	return XL
end

-- ���ַ�������Ѱһ������,�����ͬʱ����ʱΪ��
function Str_FindWords(str,list)
	local num=0
	for k=1,#list do
		if Find(str,list[k])==nil then break end
		num=num+1
	end
	return num==#list
end

-- ���������ʼ��: ����","����"+"ȥ��"-", ���ظ�ʽ�б���������б�
function Str_FindBDS_Init(sFile)
	local fp1=assert(io.open(sFile,"r"))
	local List={}  -- �ؼ����б�
	local Code={}  -- ������б�
	local pp=1
	while true do
		mm=fp1:read("*line")
		if mm==nil then break end
		mm=Split(mm,"\t")
		nn=Split(mm[#mm],",")
		if #mm>=2 then
			List[#List+1]={}
			Code[#Code+1]=mm[1]
		elseif #List==0 then
			List[#List+1]={}
		end
		for i=1,#nn do
			if Find(nn[i],"+") then
				kk=Split(nn[i],"+")
				List[#List][i]={"+",kk[1],kk[2]}
			elseif Find(nn[i],"-") then
				kk=Split(nn[i],"-")
				List[#List][i]={"-",kk[1],kk[2]}
			else
				List[#List][i]={"",nn[i]}
			end
		end
	end
	fp1:close()
	return List,Code
end

-- ��������, ��������
function Str_FindBDS(mm,List)
	local Count={}
	for j=1,#List do
		Count[j]=0
		for k=1,#List[j] do
			if List[j][k][1]=="+" then
				local iflag=0
				for r=2,#List[j][k] do  -- ��1����"+"
					if Find(mm,List[j][k][r]) then iflag=iflag+1 end
				end
				if iflag==#List[j][k]-1 then Count[j]=1 end
			elseif List[j][k][1]=="-" then  -- ��1����"-"
				if Find(mm,List[j][k][2]) then  -- ���е�2��
					local iflag=0
					for r=3,#List[j][k] do
						if Find(mm,List[j][k][r]) then iflag=1 end
					end
					if iflag==0 then Count[j]=1 end
				end
			else   -- List[j][k][1]==""
				if Find(mm,List[j][k][2]) then Count[j]=1 end
			end
		end
	end
	return Count
end

-- ���UTF8�ַ����Ƿ���ȷ, ȥ�����Ϸ����ַ�.
function Str_Check_UTF8(UTF8S)
	return table.concat(XL_UTF8(UTF8S))
end

-- ���ݲ�εݽ���ϵ, ����ĳ�����ݵ�ȫ��·��
function  Tree_AllPath(Biao,nKey,nValue)
	local data={}
	for i=1,#Biao do
		local key=Biao[i][nKey]
		Biao[i][#Biao[i]+1]=Biao[i][nValue]
		data[key]=Biao[i]
		for j=#key-1,1,-1 do  -- �����ϼ�������
			tt=key:sub(1,j)
			if data[tt] then
				data[key][#Biao[i]] = data[tt][#data[tt]].."/" .. data[key][#Biao[i]]
				break
			end
		end
	end
	return data
end

-- �������Ĳ㼶�ṹ
function Tree_Struct(Biao,nKey)
	local List={}
	for ii=1,#Biao do
		local key=Biao[ii][nKey]
		local tt=List
		for jj=1,#key-1 do
			local ss=key:sub(1,jj)
			if tt[ss] then tt=tt[ss] end
		end
		tt[key]={}
	end
	return List
end

-- ����Join��
function Tree_Join(List,Data,BZList,nw,ch)
	local Line={}
	local flag=0
	local nn=nw
	for k1 in pairs(List) do
		local iflag=0
		for k2 in pairs(List[k1]) do
			iflag=1
			break
		end
		if iflag==1 then  -- ���Ӽ�
			local ss1=string.rep(" ",nn)..'{\n'
			for jj=1,#BZList do
				ss1=ss1 .. string.rep(" ",nn+2) .. BZList[jj][1] .. Data[k1][BZList[jj][2]] .. BZList[jj][3] .. ",\n"
			end
			ss1=ss1 .. string.rep(" ",nn+2) .. '"children": \n'
			ss1=ss1 .. string.rep(" ",nn+2) .. "[\n"
			ss1=ss1 .. Tree_Join(List[k1],Data,BZList,nn+4,ch) .. "\n"
			ss1=ss1 .. string.rep(" ",nn+2) .. ']\n'
			ss1=ss1 .. string.rep(" ",nn) .. '}'
			Line[#Line+1]=ss1
		else
			local ss1=string.rep(" ",nn) .. '{' .. (ch or "")
			for jj=1,#BZList do
				ss1=ss1 .. (ch=="\n" and string.rep(" ",nn+2) or "") .. BZList[jj][1] .. Data[k1][BZList[jj][2]] .. BZList[jj][3] .. (jj<#BZList and "," or "") .. (ch or "")
			end
			ss1=ss1 .. (ch=="\n" and string.rep(" ",nn) or "") .. '}'
			Line[#Line+1]=ss1
		end
		flag=1
	end
	return table.concat(Line,",\n")
end

-- �������Ȩ��ת��Ϊ����Ȩ��
function Tree_Power(TB)
	local nn,sum
	--��������˳��, ��д������ʶ
	for i=1,#TB do
		TB[i][1]=Trim(TB[i][1])  --ȥ��ǰ��Ŀո��
		TB[i][3]=tonumber(TB[i][3])
		TB[i][4]=tonumber(TB[i][4])
		TB[i][5]=i  -- ��ǰ���е�˳���,���ڻָ���ʼ˳��
		nn=Split("A." .. Trim(TB[i][1]),".")
		while nn[#nn]=="" do nn[#nn]=nil end
		TB[i][1]=table.concat(nn,".").."."
		nn[#nn]=nil  --ȥ��ĩ��, �Ա��ڵõ��ϼ�����
		TB[i][6]=table.concat(nn,".").."."  --�ϼ��ı���
	end

	-- ���ո�����ʶ�͵�ǰ��˳������
	table.sort(TB,function (a,b) if a[6]~=b[6] then return a[6]<b[6] else return a[3]<b[3] end end)

	--���㱾�����Ȩ��(�������Ȩ��֮��Ϊ1)
	local data,ss={1},TB[1][6]  --Ȩ��,�ϼ���ʶ
	for i=2,#TB do
		if ss~=TB[i][6] then
			sum=XL_Sum(data)  -- ������
			for j=1,#data do TB[i-1+j-#data][7]=data[j]/sum end  --�õ����Ȩ��
			data,ss={1},TB[i][6]
		else
			data[#data+1]=(data[#data] or 1) / TB[i][4]
		end
	end -- ���һ��û�д���,��Ҫ��������
	sum=XL_Sum(data)  -- ������
	for j=1,#data do TB[#TB+j-#data][7]=data[j]/sum end  --�õ����Ȩ��

	--����ȫ��Ȩ��(��ǰ��Ŀȫ��Ȩ�� = �ϼ�Ȩ�� * �������Ȩ��)
	local List={}
	for i=1,#TB do List[TB[i][1]]=i end  -- �����
	for i=1,#TB do
		if List[TB[i][6]] then
			TB[i][8] = TB[List[TB[i][6]]][8] * TB[i][7]
		else
			TB[i][8] = TB[i][7]
		end
	end
	-- ���ĩ��(1)�ͷ�ĩ��(0)
	for i=1,#TB do TB[i][9]=1 end
	for i=1,#TB do
		if List[TB[i][6]] then TB[List[TB[i][6]]][9]=0 end
	end
	-- �ָ���ԭ�����е�˳��
	table.sort(TB,function (a,b) return a[5]<b[5] end)
end

-- ���㡢�����ຯ��

-- ��ֵ�Լ���, ������ǰ�÷�ΪPi,���ۺ�÷�ΪQi,i=1,...,n
function JS_PQvalue(Pi,Qi)
	local sum1,sum2=0,0
	for i=1,#Pi do
		sum1=sum1+(Pi[i]-Qi[i])^2
		sum2=sum2+Pi[i]*Pi[i]
	end
	return sum1/sum2
end

--[=[  Array=
	ָ��1	ָ��2	...	ָ��K	|	+
	x11  	x12  	...	x1K 	|	S1
	... 	... 	...	... 	|	...
	xn1 	xn2 	...	xnK 	|	Sn
	------------------------------------
	mu+1	mu+2	...	mu+K	|	muS
	si+1	Si+2	...	si+K	|	siS
	ÿ��Ϊһ���˵Ĵ������,��Ϊָ����.
--]=]
-- ���ʰͺ�ϵ��, �����Ŷȼ�⹫ʽ
function JS_Cronbach(Array,Col1,Col2)  -- ���ʰͺ�ϵ�����㹫ʽ
	local SN={}        -- �ܷ�
	local mu,si={},{}  -- ��ֵ�ͷ���
	local n=#Array     -- ָ����
	Col1,Col2=Col1 or 1,Col2 or #Array[1]
	if Col1==Col2 then return 0 end
	for i=1,n do
		for j=Col1,Col2 do
			SN[i]=(SN[i] or 0) + Array[i][j]
			mu[j]=(mu[j] or 0) + Array[i][j]
		end
	end
	for j=Col1,Col2 do mu[j]=mu[j]/n end  -- ��ƽ��
	for j=Col1,Col2 do
		for i=1,n do
			si[j]=(si[j] or 0) + (Array[i][j]-mu[j])^2
		end
	end
	local muS,siS=0,0
	for i=1,n do muS=muS+SN[i] end
	muS=muS/n
	for i=1,n do siS=siS+(SN[i]-muS)^2 end
	local jg=0
	for j=Col1,Col2 do jg=jg+si[j] end
	jg=(Col2-Col1+1)/(Col2-Col1)*(1-jg/siS)
	return jg
end

--[=[  Array=
������	ָ��1	ָ��2	...	ָ��N
������1	x11  	x12  	...	x1N
......	... 	... 	...	...
������K	xK1 	xK2 	...	xKN
		-----------------------
		Ri1 	Ri2 	...	RiN
	ÿ��Ϊһ�������˵��������,��Ϊָ����.
--]=]
-- �ϵ¶���гϵ��, �Ŷȼ��鹫ʽ
function JS_KendallsW(Array)
	local Ri={}        -- ÿ���������ȼ���
	local K,N=#Array,#Array[1]
	for j=1,N do
		for i=1,K do
			Ri[j]=(Ri[j] or 0) + Array[i][j]
		end
	end
	local muRi,SS=0,0
	for j=1,N do muRi=muRi+Ri[j] end
	muRi=muRi/N
	for j=1,N do SS=SS+(Ri[j]-muRi)^2 end
	-- ������ͬ�ĵȼ�����
	local nDJ=0
	for i=1,K do
		local DJ={}
		for j=1,N do
			DJ[Array[i][j]]=(DJ[Array[i][j]] or 0) + 1
		end
		for k in pairs(DJ) do
			if DJ[k]>1 then
				nDJ=nDJ+DJ[k]*DJ[k]*DJ[k]-DJ[k]
			end
		end
	end
	local WW=12*SS/(K*K*(N*N*N-N)-K*nDJ)
	return WW
end

-- �������ٷֱ�, �����Լ���
function JS_NiXuShuBaiFenBi(xx)
	local sum=XL_NiXuShu(xx)
	return sum*2/(#xx*(#xx-1))
end

-- ���ܶȺ����ع����
function JS_KernelRegression(JZ,xh)  -- xhΪ��׼����ı���ϵ��(�Լ���)
	xh=xh or 1
	local jz,bzc,zgs=GL_JZ_JZFC(JZ)
	local hh=0.2*1.06*bzc*(zgs)^(-0.2)*xh

	local Xi={}  -- Xi������Ĺ���ֵ
	for kk=1,#JZ do
		local tt,ss=0,0
		for ii=1,#JZ do
			local rr=math.exp(-((kk-ii)/hh)^2/2)
			tt,ss=tt+JZ[ii][2]*rr,ss+rr
		end
		Xi[kk]=tt/ss
	end
	return Xi
end

-- 2*p����ͳ����data1:����,data2:ʵ��
function JS_KaFang2p(data1,data2)
	local s1,s2,sum,tt=0,0,0,0
	for k in pairs(data1) do s1=s1 + data1[k] end
	for k in pairs(data2) do s2=s2 + data2[k] end
	if s2>0 then
		for k in pairs(data1) do
			tt=s2*data1[k]/s1; sum=sum+((data2[k] or 0)-tt)^2/tt
		end
	end
	return sum
end

-- 2*2����ͳ����, �����������ӳ�����������
function JS_KaFang22(n11,n12,n21,n22)
	local n=n11+n12+n21+n22
	local k=n*(n11*n22-n12*n21)^2/((n11+n12)*(n21+n22)*(n11+n21)*(n12+n22))
	return n11*n22>=n12*n21 and k or -k
end

-- ��
function JS_Shang(data)
	local nn,sum=0,0
	for kk in pairs(data) do
		if data[kk]>0 then
			nn=nn + data[kk]
			sum=sum+data[kk]*math.log(data[kk])
		end
	end
	if nn==0 then return 0,0 end
	return math.log(nn)-sum/nn, nn
end

-- ����, ����������������������, ��ÿһ����س��Է������.
function JS_ZuShang(JZ)
	local mm,nn=0,0
	for k in pairs(JZ) do
		t1,t2=JS_Shang(JZ[k])
		mm=mm+t1*t2;  nn=nn+t2
	end
	return mm/nn
end

-- ���������
function JS_NewShang(data1,data2)
	local s1,s2,sum1,sum2,tt=0,0,0,0,0
	for k in pairs(data1) do s1=s1 + data1[k] end
	for k in pairs(data2) do s2=s2 + data2[k] end
	if s2>0 then
		for k in pairs(data1) do
			tt=data2[k]/s2; sum1=sum1-tt*math.log(tt)
			tt=(data1[k]-data2[k])/(s1-s2); sum2=sum2-tt*math.log(tt)
		end
		return (s2/s1)*sum1+((s1-s2)/s1)*sum2
	end
	return 0
end

function JS_BianJie_Fangxing(JZ)  -- �����α߽�, Ϊ�˷�ֹͼ���Զ������任
	local xmin=JZ[JZ_iMin(JZ,1)][1]
	local xmax=JZ[JZ_iMax(JZ,1)][1]
	local ymin=JZ[JZ_iMin(JZ,2)][2]
	local ymax=JZ[JZ_iMax(JZ,2)][2]
	local g=math.max(xmax-xmin,ymax-ymin)
	local bb={{Int(xmin),Int(ymin)},{Int(xmin),Int(g+ymin)+1},{Int(g+xmin)+1,Int(ymin)},{Int(g+xmin)+1,Int(g+ymin)+1}}
	return(bb)
end

function JS_BianJie_JuXing(JZ)  -- ���α߽�, Ϊ�˷�ֹͼ���Զ������任
	local xmin=JZ[JZ_iMin(JZ,1)][1]
	local xmax=JZ[JZ_iMax(JZ,1)][1]
	local ymin=JZ[JZ_iMin(JZ,2)][2]
	local ymax=JZ[JZ_iMax(JZ,2)][2]
	local bb={{Int(xmin),Int(ymin)},{Int(xmin),Int(ymax)+1},{Int(xmax)+1,Int(ymin)},{Int(xmax)+1,Int(ymax)+1}}
	return(bb)
end

--����K2�㷨�ı�Ҷ˹��ѧϰ

function K2_Count(ii, sii, jj, sjj, kk, skk) -- ͳ�Ʒ��������ļ�¼����
	local nCount=0
	if kk then
		for i=1,zRow do
			if Data[i][ii]==sii and Data[i][jj]==sjj and Data[i][kk]==skk then nCount=nCount+Data[i][0] end
		end
	elseif jj then
		for i=1,zRow do
			if Data[i][ii]==sii and Data[i][jj]==sjj then nCount=nCount+Data[i][0] end
		end
	else
		for i=1,zRow do
			if Data[i][ii]==sii then nCount=nCount+Data[i][0] end
		end
	end
	return nCount
end

function  K2_JSGen(ii)  -- ������ڵ�÷�
	local Si1 = K2_Count(ii, 1)
	local Ti1 = K2_Count(ii, 0)
	local Mi1 = Si1 + Ti1
	return GL_LnGamma(N) + GL_LnGamma(N/2+Si1) + GL_LnGamma(N/2+Ti1) - GL_LnGamma(N+Mi1) - 2*GL_LnGamma(N/2)
end

function  K2_Fu1(ii,jj)  -- �����һ�����ڵ�ĵ÷�
	local Si1 = K2_Count(ii, 1, jj, 1)
	local Ti1 = K2_Count(ii, 0, jj, 1)
	local Mi1 = Si1 + Ti1
	local jg1 = GL_LnGamma(N/2)+GL_LnGamma(N/4+Si1)+GL_LnGamma(N/4+Ti1)-GL_LnGamma(N/2+Mi1)-2*GL_LnGamma(N/4)
	local Si1 = K2_Count(ii, 1, jj, 0)
	local Ti1 = K2_Count(ii, 0, jj, 0)
	local Mi1 = Si1 + Ti1
	local jg2 = GL_LnGamma(N/2)+GL_LnGamma(N/4+Si1)+GL_LnGamma(N/4+Ti1)-GL_LnGamma(N/2+Mi1)-2*GL_LnGamma(N/4)
	return jg1+jg2
end

function  K2_Fu2(ii,jj,kk)  -- �����������ڵ�ĵ÷�
	local Si1 = K2_Count(ii, 1, jj, 1, kk, 1)
	local Ti1 = K2_Count(ii, 0, jj, 1, kk, 1)
	local Mi1 = Si1 + Ti1
	local jg1 = GL_LnGamma(N/4)+GL_LnGamma(N/8+Si1)+GL_LnGamma(N/8+Ti1)-GL_LnGamma(N/4+Mi1)-2*GL_LnGamma(N/8)
	local Si1 = K2_Count(ii, 1, jj, 1, kk, 0)
	local Ti1 = K2_Count(ii, 0, jj, 1, kk, 0)
	local Mi1 = Si1 + Ti1
	local jg2 = GL_LnGamma(N/4)+GL_LnGamma(N/8+Si1)+GL_LnGamma(N/8+Ti1)-GL_LnGamma(N/4+Mi1)-2*GL_LnGamma(N/8)
	local Si1 = K2_Count(ii, 1, jj, 0, kk, 1)
	local Ti1 = K2_Count(ii, 0, jj, 0, kk, 1)
	local Mi1 = Si1 + Ti1
	local jg3 = GL_LnGamma(N/4)+GL_LnGamma(N/8+Si1)+GL_LnGamma(N/8+Ti1)-GL_LnGamma(N/4+Mi1)-2*GL_LnGamma(N/8)
	local Si1 = K2_Count(ii, 1, jj, 0, kk, 0)
	local Ti1 = K2_Count(ii, 0, jj, 0, kk, 0)
	local Mi1 = Si1 + Ti1
	local jg4 = GL_LnGamma(N/4)+GL_LnGamma(N/8+Si1)+GL_LnGamma(N/8+Ti1)-GL_LnGamma(N/4+Mi1)-2*GL_LnGamma(N/8)
	return jg1+jg2+jg3+jg4
end

function K2_Main(sCode)  -- K2�㷨���ĳ���, ���ڵ������������Ϊ2
    local FN1,FN2={0},{0}  -- ����㼯��
	local sum=K2_JSGen(sCode[1])  --�ܵ÷�
	for iNum=2,zCol do  --��ǰ����ִ�еĽڵ�ı��
		FN1[iNum],FN2[iNum]=0,0  -- ����㼯��
		local pOld=K2_JSGen(sCode[iNum])  --��ø��ĵ÷�
		for j=1,iNum-1 do  --��õ�һ���ڵ�ĵ÷�
			local tmp=K2_Fu1(sCode[iNum], sCode[j])
			if tmp>pOld then pOld=tmp; FN1[iNum]=sCode[j] end
		end
		if FN1[iNum]>0 then
			for j=1,iNum-1 do  --��õڶ����ڵ�ĵ÷�
				if FN1[iNum]~=sCode[j] then
					local tmp=K2_Fu2(sCode[iNum], sCode[j], FN1[iNum])
					if tmp>pOld then pOld=tmp; FN2[iNum]=sCode[j] end
				end
			end
		end
		--��ǰ�ڵ��������
		if FN1[iNum]>FN2[iNum] then FN1[iNum],FN2[iNum]=FN2[iNum],FN1[iNum] end
		sum = sum + pOld
	end
	sCode[0]=sum
	sCode[-1]=FN1
	sCode[-2]=FN2
	return sum
end

function K2_OutN(sCode,fp) -- ��Ҷ˹�����
	if fp then
		fp:write("�����1\t�����2\t��ǰ���\n")
	else
		print("�����1\t�����2\t��ǰ���")
	end
	if fp then
		for i=1,zCol do
			fp:write(sCode[-1][i],sCode[-2][i],sCode[i],"\n")
		end
	else
		for i=1,zCol do
			print(sCode[-1][i],sCode[-2][i],sCode[i])
		end
	end
end

function K2_OutP(sCode,fp) -- ��Ҷ˹������������ʷֲ�
	local cur,sum
	if fp then
		fp:write("�����1\t�����2\t��ǰ���\n")
	else
		print("�����1\t�����2\t��ǰ���")
	end
	for k=1,zCol do
		print(sCode[-1][k],sCode[-2][k],sCode[k])
		if sCode[-1][k]==0 and sCode[-2][k]==0 then
			for i=0,1 do
				print(K2_Count(sCode[k], i)/zzRow)
			end
		elseif (sCode[-1][k]==0 and sCode[-2][k]>0) then
			for i=0,1 do
				for j=0,1 do
					cur=K2_Count(sCode[k], i, sCode[-2][k], j)
					sum=K2_Count(sCode[-2][k], j)
					if fp then
						fp:write(sum>0 and cur/sum or 0,"\t")
					else
						io.write(sum>0 and cur/sum or 0,"\t")
					end
				end
				if fp then
					fp:write("\n")
				else
					io.write("\n")
				end
			end
		elseif (sCode[-1][k]>0 and sCode[-2][k]>0) then
			for i=0,1 do
				for j=0,1 do
					for m=0,1 do
						cur=K2_Count(sCode[k], i, sCode[-1][k], j, sCode[-2][k], m)
						sum=K2_Count(sCode[-1][k], j, sCode[-2][k], m)
						if fp then
							fp:write(sum>0 and cur/sum or 0,"\t")
						else
							io.write(sum>0 and cur/sum or 0,"\t")
						end
					end
				end
				if fp then
					fp:write("\n")
				else
					io.write("\n")
				end
			end
		end
	end
end

-- �Ŵ��㷨, ����ĳһ����������

function  YC_Init()  -- ��Ⱥ��С, ���峤��
	for ii=1,ZQSize do
		ZQSet[ii]=XL_SetN(GTLen)
		XL_LuanXu(ZQSet[ii],1+ypNode)
		K2_Main(ZQSet[ii])  -- ����K2����
	end
end

-- ��������
function YC_Main(nCiShu)  -- ��������, ��������nCiShu
	for n=1,nCiShu do
		for k=1,ZQSize,2 do  --������������
			mm=Rand()
			if mm<0.25 then YC_LianSuo(k,k+1) end
		end
		for k=1,ZQSize do  -- �Ŵ�����
			mm=Rand()
			if mm<0.07 then YC_BianYi(k) end
		end
		for k=ZQSize+1,#ZQSet do
			K2_Main(ZQSet[k])  -- ����K2����
		end
		table.sort(ZQSet,YC_px)   -- �Ե÷�����
		-- �ָ���Ⱥ����, ���Ժ��������Ϣ
		for k=#ZQSet,ZQSize+1,-1 do ZQSet[k]=nil end
	end
end

-- �Ŵ�����
function YC_BianYi(kk)
	--���������λ��, ������λ����ͬ��������.
	j1,j2=0,0
	while j1==j2 do
		j1=Rand()*(GTLen-ypNode)+1+ypNode; j1=j1-j1%1
		j2=Rand()*(GTLen-ypNode)+1+ypNode; j2=j2-j2%1
	end
	--����һ��������
	ZQSet[#ZQSet+1]=XL_Copy(ZQSet[kk])
	--����j1��j2λ�õ���ֵ
	ZQSet[#ZQSet][j1],ZQSet[#ZQSet][j2] = ZQSet[#ZQSet][j2],ZQSet[#ZQSet][j1]
end

--������������
function YC_LianSuo(n1,n2)
	--������������
	ZQSet[#ZQSet+1]=XL_Copy(ZQSet[n1]);  n1=#ZQSet
	ZQSet[#ZQSet+1]=XL_Copy(ZQSet[n2]);  n2=#ZQSet
	--�����һ��λ��
	local kk=Rand()*(GTLen-1-ypNode)+2+ypNode; kk=kk-kk%1
	--�ڴ�λ���Ͻ�����������
	for jj=kk,GTLen do
		ZQSet[n1][jj],ZQSet[n2][jj] = ZQSet[n2][jj],ZQSet[n1][jj]
	end
	--����ÿһ����
	YC_LSTiaoZheng(n1)
	YC_LSTiaoZheng(n2)
end

function YC_LSTiaoZheng(nn)       -- ���������������λ�õ���
	local t1=XL_Set(GTLen,0)      -- ����һ������������
	local t2={}                   -- �����ظ���λ��
	for jj=1,GTLen do             -- ��һ��ȫ����, �����ĸ�λ���ظ���
		if t1[ZQSet[nn][jj]]>0 then
			t2[#t2+1]=jj
		else
			t1[ZQSet[nn][jj]]=1
		end
	end
	local t3={}         -- ������Щ��û�г���
	for jj=1,GTLen do   -- ��һ��ȫ����, �����ĸ���ֵ����0, ��û��ʹ�ù�.
		if t1[jj]==0 then t3[#t3+1]=jj end
	end
	XL_LuanXu(t3) -- ����
	-- ���ջ�����ظ�λ��, ��ԭt3�е���
	for jj=1,#t2 do ZQSet[nn][t2[jj]]=t3[jj] end
end

YC_px=function (a,b) return a[0]>b[0] end  -- ϵͳĬ��0���д���Ⱥ����Ӧ��

-- ŷ�Ͼ����ƽ��
function PB_OShiJuLi(point1,point2)   -- �����������ŷ�Ͼ����ƽ��
	local dd=0
	for i=1,#point1 do
		dd=dd+(point1[i]-point2[i])^2
	end
	return dd
end

-- �����ʵ��֤
function PB_JiaoChaHeShi(JZ,bb,panbie)  -- �����ʵ��֤(���ݾ���, ���ݷ���, ��ȡ�������ݺ���)
	XL_LuanXu(JZ)
	local nn,sum=#JZ,0
	for ii=1,bb do
		local test,data={},{}
		for jj=1,nn do
			if (nn*(ii-1)-nn*(ii-1)%bb)/bb+1<=jj and jj<=(ii*nn-ii*nn%bb)/bb then
				test[#test+1]=JZ[jj]
			else
				data[#data+1]=JZ[jj]
			end
		end
		local dd=panbie(data,test)
		local gs=0
		for mm=1,#test do
			if test[mm][0]==dd[mm] then gs=gs+1 end
		end
		sum=sum+gs/#test
	end
	return sum/bb
end

-- K�����㷨
function PB_KNN(data,test)   -- K�����㷨(ѵ��������, ���Լ�����)
	local dd,tt={},{}
	local KK=15          -- K����֮K
	for ii=1,#test do
		for jj=1,#data do
			dd[jj]={data[jj][0],OShiJuLi(test[ii],data[jj])}  -- ���, ����ֵ
		end
		table.sort(dd,function(a,b) return a[2]<b[2] end)
		local JL={}
		for jj=1,KK do
			JL[dd[jj][1]] = (JL[dd[jj][1]] or 0) + 1
		end
		local LB=JZ_FromZD(JL,{-2})  -- ���ֵ䰴ֵ����, ����
		tt[ii]=LB[1][1]  -- K����
	end
	return tt
end

-- ��Ҷ˹�ı���ģ; �����ļ�, �ı��ļ�
-- ����ֵ: Power, Power[i]={������(�ַ�����ʽ),�ĵ�����,�ִ�������,�ִʴ�Ƶ��}
function PB_Bayes_TextCreatModel(DM_File,XL_File,CiKu)
	local Power={}
	local fp1=assert(io.open(DM_File,"r"))
	local fp2=assert(io.open(XL_File,"r"))
	local bb={}
	local mm1,mm2="",""
	while true do
		mm1=fp1:read("*line")
		mm2=fp2:read("*line")
		if mm1==nil then break end
		if mm1:sub(-1,-1)==string.char(13) then mm1=mm1:sub(1,-2) end
		if mm2:sub(-1,-1)==string.char(13) then mm2=mm2:sub(1,-2) end
		if bb[mm1]==nil then      --�ĵ�����
			Power[#Power+1]={mm1,1,0,{}}
			bb[mm1]=#Power
		else
			Power[bb[mm1]][2]=Power[bb[mm1]][2]+1  -- Ȩ��Ĭ��Ϊ1
		end
		mm2=Str_DelAsciiChar(mm2) --ɾ���Ǻ����ַ�
		ff=Str_ZhX_FenCi(mm2,CiKu) --����ִ�
		ff=XL_QuChong(ff)

		for i=1,#ff do
			Power[bb[mm1]][4][ff[i]]= (Power[bb[mm1]][4][ff[i]] or 0) + 1 --ͳ��ÿ����������, Ȩ��Ĭ��Ϊ1
		end
	end
	fp1:close()
	fp2:close()
	for i=1,#Power do --ͳ�Ƶ�������
		Power[i][3]=0
		for k in pairs(Power[i][4]) do
			Power[i][3]=Power[i][3] + Power[i][4][k]
		end
	end
	return Power
end

-- ��Ҷ˹�ı��б�; �ı��ļ�, ����ģ��
-- ����ֵ: ������(�ַ�����ʽ)
function PB_Bayes_Text_PB(ss,CiKu,Power)
	local mm=Str_DelAsciiChar(ss) --ɾ���Ǻ����ַ�
	local ff=Str_ZhX_FenCi(mm,CiKu) --����ִ�
	ff=XL_QuChong(ff)
	if #ff==0 then return "" end
	local pp={}
	for i=1,#Power do
		pp[i]=math.log(Power[i][2])
		for j=1,#ff do
			pp[i]=pp[i]+math.log((Power[i][4][ff[j]] or 0)+0.5)
		end
		pp[i]=pp[i]-#ff*math.log(Power[i][3]+23000)
	end
	local k=1
	for i=2,#pp do if pp[k]<pp[i] then k=i end end -- �������
	return Power[k][1]
end

-- ���ļ�д������ģ��,�޷���ֵ
-- Power[i]={������(�ַ�����ʽ),�ĵ�����,�ִ�������,�ִʴ�Ƶ��(����ʽ)}
--[[
	������
		#Power
	Powerÿ������
		A01,123,345,{}
		... ... (�� #Power ��)
	Power�ִʴ�Ƶ��
		�к� ���� �ִ�
		... ... (ֱ���ļ�β)
--]]
function PB_Beyes_TextOptionWrite(XL_File,Power)
	local fp=assert(io.open(XL_File,"w"))
	fp:write(#Power,"\n")
	for i=1,#Power do
		fp:write(Power[i][1]," ",Power[i][2]," ",Power[i][3],"\n")
	end
	for i=1,#Power do
		for k in pairs(Power[i][4]) do
			fp:write(i," ",Power[i][4][k]," ",k,"\n")
		end
	end
	fp:close()
	return Power
end

-- ���ļ����������ģ��,����ģ�ͱ� Power
-- Power[i]={������(�ַ�����ʽ),�ĵ�����,�ִ�������,�ִʴ�Ƶ��(����ʽ)}
function PB_Beyes_TextOptionRead(XL_File)
	local fp=assert(io.open(XL_File,"r"))
	local Power={}
	local Num=tonumber(fp:read("*line"))
	for i=1,Num do
		local kk=fp:read("*line")
		if kk:sub(-1,-1)==string.char(13) then kk=kk:sub(1,-2) end
		kk=Split(kk," ")
		Power[i]={kk[1],tonumber(kk[2]),tonumber(kk[3]),{}}
	end
	while true do
		local k1,k2,k3=fp:read("*number","*number","*line")
		if k1==nil then break end
		if k3:sub(-1,-1)==string.char(13) then k3=k3:sub(1,-2) end
		Power[k1][4][k3:sub(2)]=k2 -- �����ַ���֮ǰ�пո�ָ�
	end
	fp:close()
	return Power
end

-- ϵͳ����������
SysOpt={
	"GBK",   -- 1.ϵͳ�ڲ������ʽ, GBK �� UTF8
	"V2.0",  -- 2.ϵͳ�汾��
}
