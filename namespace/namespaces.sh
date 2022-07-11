# 프로세스별로 별도의 커널 자원을 분할 하는 리눅스 커널 기능
# 종류 : ipc. mnt, net, pid pid_for_children, uts

# cgroups은 "how much you can use"를 제한
# namespace는 "what you can see"를 제한

# PID : process ID 정보를 격리, 다른 프로세스에 접근 불가
# Network : 네티워크 장치, IP 주소, 포트, 라우팅 테이블 등의 네트워크 리소스 격리
# User : 프로세서 별 UID, GID 정보 격리
# Mount : 프로세스별 마운트 되는 파일 시스템 격리ㅏ
# IPC : inter-process communication 격리 다른 프로세서의 접근이나 제어를 방지
# UTS : 호스트 명이나 도메인 명을 격리

# fmpfs : 메모리 기반 파일 시스템
#       - 사이즈를 지정하지 않으면 물리 메모리의 절반까지 사용 가능
#       - 휘발성 공간