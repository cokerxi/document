2025年03月23日23:27:55
长文件名无法复制
使用其他协议传输文件**
- **FTP传输**：
  1. 在群晖控制面板启用 **FTP服务**（控制面板 > 文件服务 > FTP）。
  2. 使用FileZilla等FTP客户端连接到群晖（ip，账号密码`），直接上传文件。


2025年03月23日10:25:09
首先ssh连接到群晖dsm，输入sudo -i 切换到管理员模式

// 列出所有nvme硬盘

ls /dev/nvme*n1 

**********以下开始是重点***************

//第一步：分区，适合1个nvme的情况，注意0代表第一块nvme
synopartition --part /dev/nvme0n1 12

//第二步：查看当前存储池的序号,记下来，这一步不是必须的，因为序号可以填写很大的
cat /proc/mdstat

//第三步：创建NVME 存储池，其中md6中的6代表要创建的存储池的序号。
mdadm --create /dev/md6 --level=1 --raid-devices=1 --force /dev/nvme0n1p3

//第四步：格式化存储空间，ext4格式
mkfs.ext4 -F /dev/md6  

//备注：第四步，如果想格式化为btrfs，则执行如下⬇️（*****2023.03.26更新）
mkfs.btrfs -f /dev/md6

//第五步：重启群晖NAS
reboot
*******************代码部分结束了***************************

后续操作：在dsm后台中 找到

存储空间——可用池1——在线重组

2块Nvme硬盘的情况，如何组Raid，比如Raid0

//第一步：分别 给 两块nvme的 ssd 分区
synopartition --part /dev/nvme0n1 12
synopartition --part /dev/nvme1n1 12

//第二步：创建 raid 0的存储池，其中md6中的6代表要创建的存储池的序号。
mdadm --create /dev/md6 --level=0 --raid-devices=2 --force /dev/nvme0n1p3 /dev/nvme1n1p3

//第三步：格式化存储池
mkfs.ext4 -F /dev/md6

第四步：重启群晖NAS，并在线重组
存储空间——可用池1——在线重组
*******************代码部分结束了***************************
