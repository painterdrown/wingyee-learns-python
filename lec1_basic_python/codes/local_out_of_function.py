# local_out_of_function.py
# # 在函数外面访问局部变量（BUG）
# 本来有 BUG 的，但是在某些解释器（如 IPython）里面却可以运行，但是不代表没错！
# 使用命令行运行该文件会报错，在 Jupyter Notebook 里面不会

def localName():
  name = 'Wingyee Lam'
    
print(name)
