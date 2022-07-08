# cgroup
# 프로세스들이 사용하는 시스템 자원의 사용 정보를 수집 및 제한 하는 리눅스 커널
# 제한 가능 자원 : CPU, Memory, Network, Device, Block I/O

# CPU : 스케줄러를 이용하여 해당 cgroup에 속한 프로세스의 CPU 사용량을 제한
# Memory :  해당 cgroup에 속한 프로세스의 Memory 사용량을 제한
# freezer : cgroup의 작업을 일시 중지하거나 다시 시작 (docker pause)

sudo apt install -y stress

sudo su 

cd /sys/fs/cgroup/cpu

mkdir utils && cd utils

# 자신(터미널)의 프로세스 ID 출력
echo $$

# 자신의 프로세스 ID를 tasks에 삽입
echo $$  > tasks

# period 값 확인하기
cat cpu.cfs_period_us 

#  CPU 사용량 10% 제한 
echo 10000 > cpu.cfs_quota_us

# stress tast -c는 코어 개수
stress -c 1

# CPU 사용량 확인 
top
