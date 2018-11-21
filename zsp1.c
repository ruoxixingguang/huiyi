#include<iostream>
using namespace std;
struct Page {
	int pno;
	int flag;
	int cno;
	int modf;
	int addr;
}Page;
void changeaddr(struct Page p[], int logaddr) {
	int j = logaddr / 64;
	int k = logaddr % 64;
	int flag = 0;
	int addr;
	for (int i = 0; i<8; i++)
	{
		if (p[i].pno == j)
		{
			if (p[i].flag == 1)
			{
				addr = p[i].cno * 64 + k;
				cout << "物理地址为: " << addr << endl;
				cout << "详细信息: " << "\t页面号：" << p[i].pno << "\t主存号:" << p[i].cno << "\t偏移量：" << k << endl;
				flag = 1;
				break;
			}
		}
	}
	if (flag == 0)
		cout << "*该页号不在主存,产生缺页中断" << endl;
}
int main()
{
	int con = 1;
	int ins;
	struct Page p[8];
	p[0].pno = 0; p[0].flag = 1; p[0].cno = 5; p[0].modf = 1; p[0].addr = 011;
	p[1].pno = 1; p[1].flag = 1; p[1].cno = 8; p[1].modf = 1; p[1].addr = 012;
	p[2].pno = 2; p[2].flag = 1; p[2].cno = 9; p[2].modf = 0; p[2].addr = 013;
	p[3].pno = 3; p[3].flag = 1; p[3].cno = 10; p[3].modf = 0; p[3].addr = 015;
	p[4].pno = 4; p[4].flag = 0; p[4].addr = 017;
	p[5].pno = 5; p[5].flag = 0; p[5].addr = 025;
	p[6].pno = 6; p[6].flag = 0; p[6].addr = 212;
	p[7].pno = 7; p[7].flag = 0; p[7].addr = 213;
	while (con)
	{
		cout << "请输入指令的逻辑地址：";
		cin >> ins;
		changeaddr(p, ins);
		cout << "是否继续？（“1”为是，“0”为否）：";
		cin >> con;
		cout << "                  " << endl;
	}
	system("pause");
}
