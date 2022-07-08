# 프로세스가 무한정 자신을 복제하며 이로 인한 시스템 자원 고갈 공격

sudo cd /sys/fs/cgroup/pids

mkdir police && cd police

# 프로세스 제한 확인
cat pids.max

# 프로세스 생성 갯수 제한
echo 10 > pids.max

echo $$ > tasks

# fork bomb 실행
:(){ :|:& };:

# 생성된 프로세스 확인
ps aux

# 프로세스 생성 갯수 제한
