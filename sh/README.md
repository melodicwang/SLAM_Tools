## sh文件编写


开头
```
#!/bin/sh
```

要使编写脚本可执行 编译chmod +x filename 这样才能用./filename来运行





### 文件表达式
```
if test [ -f file ] 文件存在		则为真
if test [ -d ...  ] 目录存在
if test [ -s file ] 文件存在且非空
if test [ -r file ] 文件存在且可读
if test [ -w file ] 文件存在且可写
if test [ -x file ] 文件存在且可执行 
```

### 通配符 *
```
find . -name '*.sh'
```



### Example
```
#!/bin/sh

#This sh file is built for building a project.


if test -d build
then
	echo "The build directory is already exist."
	echo "Deleting it now ..."
	rm -r build
else
	echo "The build directory is not exist."
fi


echo "Building the build directory ..."
mkdir build
echo "The build directory is built now."

cd build/
echo "Now we are in the build/ ..."


echo "cmake .. ing..."
cmake ..
echo "cmake .. is done."

echo "make -j12 ing..."
make -j12
echo "make -j12 is done."


echo "Deleting the build directory ..."
rm -r build
echo "The build directory is deleted now."
```

## 参考资料

(sh脚本语法)[https://www.jianshu.com/p/ed153a81af77]




