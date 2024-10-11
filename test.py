import os

cwd = os.getcwd()

print(cwd)

for item in os.listdir(cwd + "/.."):
    print(item)

