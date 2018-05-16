# add_function.py
# 输入两个整数，使用函数相加

def add(a, b):
  c = a + b
  return c

a = input('input a: ')
b = input('input b: ')
c = add(int(a), int(b))
print('a + b = ' + str(c))
