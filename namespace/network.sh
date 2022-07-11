# 2개의 network namespace 생성 두 namespace의 통신 확인 
# docker의 bridge(네트워크 스위치와 같은 역할 연결된 인터페이스로 패킷 전달) 드라이버 형태
# VETH (Virtual Ethernet): 로컬 이더넷 터널 network namespacedm의 통신을 가능하게 함 (항생 페어로 구성)

sudo su

# network namespace 생성
ip netns add ns0
ip netns add ns1

# 생성 확인
ip netns list

# namespace모든 인터페이스 정보 확인 
ip netns exec ns0 ip link
ip netns exec ns1 ip link

ip netns exec ns0 ip link set lo up
ip netns exec ns1 ip link set lo up

# 브릿지 정보 확인
ip link show type bridge

# 호스트에 새로운 브릿지 네티워크 인터페이스 생성
ip link add br0 type bridge
# 구동
ip link set br0 up

# 브릿지 네트워크에 IP 설정
ip addr add 192.168.2.1/24 dev br0
ip addr
ping -c 2 192.168.2.1

# veth*, ceth*를 위한 veth 페어 생성
ip link add veth0 type veth peer name ceth0
ip link add veth1 type veth peer name ceth1

# veth를 br0에 연결
ip link set veth0 master br0
ip link set veth1 master br0

# veth 시작
ip link set veth0 up
ip link set veth1 up

# ceth*를 ns* 네임스페이스에 연결
ip link set ceth0 netns ns0
ip link set ceth1 netns ns1

# ceth* 시작
ip netns exec ns0 ip link set ceth0 up
ip netns exec ns1 ip link set ceth1 up

# ns*의 ceth* 인터페이스에 IP 할당
ip netns exec ns0 ip addr add 192.168.2.2/24 dev ceth0
ip netns exec ns1 ip addr add 192.168.2.3/24 dev ceth1

# ns1 네트워크 인터페이스 확인
ip netns exec ns1 ip addr

# ns0에서 ns1로 통신하기
ip netns exec ns0 ping -c 2 192.168.2.3


