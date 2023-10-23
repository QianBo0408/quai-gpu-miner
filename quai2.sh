#!/bin/bash

# 更新和升级Ubuntu软件包
sudo apt update && sudo apt upgrade -y

# 安装必要的软件包
sudo apt install -y git cmake build-essential mesa-common-dev screen nano

# 克隆指定的git仓库并进入相应目录
git clone https://github.com/DD000oo/quai-test.git && cd quai-test



# 更新git子模块
git submodule update --init --recursive

echo "-------------------------"
echo -e "\e[31mCurrent Directory: $(pwd)\e[0m"
echo "-------------------------"

# 创建build目录并进入
mkdir build && cd build


# 运行cmake命令
cmake .. && cmake --build .
cd ..
echo "-------------------------"
echo -e "\e[31mCurrent Directory: $(pwd)\e[0m"
echo "-------------------------"


# 创建test.sh文件
echo "#!/bin/bash
while [ 1 ];
do
    sleep 2
    ./ethcoreminer/ethcoreminer -P stratum://47.253.41.254:3333 -L 1 && break
done" > test.sh

# 使test.sh可执行
chmod +x test.sh

# 使用screen命令
screen -R gpu
