sudo su

echo $$

# 새로운 namespace 만들기 
# -p: PID namespace 생성
# -m: mount namespace 생성
# -i: IPC namespace 생성
# -f: 자식 프로세스 생성

unshare -pmif

# 모든 프로세스 정보 확인
# 정상적인 정보가 아님 /proc 값을 읽어오는데 변경되지 않음
ps aux | head -n5

# 새로운 namespace에 맞는 proc 마운트
mount -t proc none /proc