# input_from_excel.py
# 从 excel 文件获取 input
# 首先在命令行输入 pip3 install xlrd 来安装 xlrd 库

import xlrd

data = xlrd.open_workbook('data/people.xlsx')
table = data.sheets()[0]
print(table.cell(0, 0).value, table.cell(0, 1).value)
print(table.cell(1, 0).value, table.cell(1, 1).value)
print(table.cell(2, 0).value, table.cell(2, 1).value)
