import sys
import os

dir = sys.argv[1]
ext = sys.argv[2]
number = int(sys.argv[3])

os.chdir(dir)
for file in os.listdir('.'):
    if file.endswith(ext):
        file_name = os.path.splitext(file)[0]
        extension = os.path.splitext(file)[1]
        new_file_name = file_name[:-number] + extension
        try:
            os.rename(file, new_file_name)
        except OSError as e:
            print(e)
        else:
            print(f"Renamed {file} to {new_file_name}")