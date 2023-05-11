<<<<<<< HEAD
# python3 -c "from struct import pack,unpack;print(unpack('>H', pack('H', 1433))[0])"
# 39173
=======
# port decimal to BE
# 1433 -> 39173
# 11020 -> 3115
# 11002 -> 64042
python3 -c "from struct import pack,unpack;print(unpack('>H', pack('H', 1433))[0])"

# python3 -c "from struct import pack,unpack;print(unpack('>H', pack('H', 1433))[0])"
>>>>>>> 3474737ac86aa1e7158f20b52a4e8d020cddd33b
python3 /usr/share/bcc/tools/trace -tu \
-I 'net/sock.h' -I 'uapi/linux/ip.h' -I 'linux/tcp.h' -I 'net/inet_connection_sock.h' \
'tcp_rcv_established(struct sock *sk, struct sk_buff *skb) (sk->sk_dport == 39173) "%x %d quick=%u pingpong=%u", (((struct iphdr *)(skb->head + skb->network_header))->id), (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'tcp_event_data_recv(struct sock *sk, struct sk_buff *skb) (sk->sk_dport == 39173) "%x %d quick=%u pingpong=%u lrcvtime=%u ato=%u", (((struct iphdr *)(skb->head + skb->network_header))->id), (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong), (inet_csk(sk)->icsk_ack.lrcvtime), (inet_csk(sk)->icsk_ack.ato)' \
'tcp_send_ack(struct sock *sk) (sk->sk_dport == 39173) "%d lrcvtime=%u", (sk->sk_num), (inet_csk(sk)->icsk_ack.lrcvtime)' \
'__tcp_ack_snd_check(struct sock *sk, int ofo_possible) (sk->sk_dport == 39173) "%d ofo_possible=%d quick=%u pingpong=%u", (sk->sk_num), ofo_possible, (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'tcp_send_delayed_ack(struct sock *sk) (sk->sk_dport == 39173) "%d quick=%u pingpong=%u", (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'__tcp_transmit_skb(struct sock *sk) (sk->sk_dport == 39173) "%d quick=%u pingpong=%u %u-%u<%u" (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong), ((u32)bpf_jiffies64()), (inet_csk(sk)->icsk_ack.lrcvtime), (inet_csk(sk)->icsk_ack.ato)' \
'tcp_update_skb_after_send(struct sock *sk) (sk->sk_dport == 39173) "%d quick=%u pingpong=%u", (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'__tcp_sock_set_quickack(struct sock *sk, int val) "%d %d", (sk->sk_num), val' \
<<<<<<< HEAD
'tcp_enter_quickack_mode(struct sock *sk, unsigned int max_quickacks) "%d %u", (sk->sk_num), max_quickacks' > 100-net.core.tcp_pingpong_thresh_3_-port-1433.txt


# python3 -c "from struct import pack,unpack;print(unpack('>H', pack('H', 11037))[0])" 
# 7467
python3 /usr/share/bcc/tools/trace -tu \
-I 'net/sock.h' -I 'uapi/linux/ip.h' -I 'linux/tcp.h' -I 'net/inet_connection_sock.h' \
'tcp_rcv_established(struct sock *sk, struct sk_buff *skb) (sk->sk_dport == 7467) "%x %d quick=%u pingpong=%u", (((struct iphdr *)(skb->head + skb->network_header))->id), (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'tcp_event_data_recv(struct sock *sk, struct sk_buff *skb) (sk->sk_dport == 7467) "%x %d quick=%u pingpong=%u lrcvtime=%u ato=%u", (((struct iphdr *)(skb->head + skb->network_header))->id), (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong), (inet_csk(sk)->icsk_ack.lrcvtime), (inet_csk(sk)->icsk_ack.ato)' \
'tcp_send_ack(struct sock *sk) (sk->sk_dport == 7467) "%d lrcvtime=%u", (sk->sk_num), (inet_csk(sk)->icsk_ack.lrcvtime)' \
'__tcp_ack_snd_check(struct sock *sk, int ofo_possible) (sk->sk_dport == 7467) "%d ofo_possible=%d quick=%u pingpong=%u", (sk->sk_num), ofo_possible, (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'tcp_send_delayed_ack(struct sock *sk) (sk->sk_dport == 7467) "%d quick=%u pingpong=%u", (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'__tcp_transmit_skb(struct sock *sk) (sk->sk_dport == 7467) "%d quick=%u pingpong=%u %u-%u<%u" (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong), ((u32)bpf_jiffies64()), (inet_csk(sk)->icsk_ack.lrcvtime), (inet_csk(sk)->icsk_ack.ato)' \
'tcp_update_skb_after_send(struct sock *sk) (sk->sk_dport == 7467) "%d quick=%u pingpong=%u", (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'__tcp_sock_set_quickack(struct sock *sk, int val) "%d %d", (sk->sk_num), val' \
'tcp_enter_quickack_mode(struct sock *sk, unsigned int max_quickacks) "%d %u", (sk->sk_num), max_quickacks' > 100-net.core.tcp_pingpong_thresh_3_-port-11037.txt


=======
'tcp_enter_quickack_mode(struct sock *sk, unsigned int max_quickacks) "%d %u", (sk->sk_num), max_quickacks' > 100-test-quickack-initcontainer-port-1433.txt


# python3 -c "from struct import pack,unpack;print(unpack('>H', pack('H', 11020))[0])"
python3 /usr/share/bcc/tools/trace -tu \
-I 'net/sock.h' -I 'uapi/linux/ip.h' -I 'linux/tcp.h' -I 'net/inet_connection_sock.h' \
'tcp_rcv_established(struct sock *sk, struct sk_buff *skb) (sk->sk_dport == 3115) "%x %d quick=%u pingpong=%u", (((struct iphdr *)(skb->head + skb->network_header))->id), (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'tcp_event_data_recv(struct sock *sk, struct sk_buff *skb) (sk->sk_dport == 3115) "%x %d quick=%u pingpong=%u lrcvtime=%u ato=%u", (((struct iphdr *)(skb->head + skb->network_header))->id), (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong), (inet_csk(sk)->icsk_ack.lrcvtime), (inet_csk(sk)->icsk_ack.ato)' \
'tcp_send_ack(struct sock *sk) (sk->sk_dport == 3115) "%d lrcvtime=%u", (sk->sk_num), (inet_csk(sk)->icsk_ack.lrcvtime)' \
'__tcp_ack_snd_check(struct sock *sk, int ofo_possible) (sk->sk_dport == 3115) "%d ofo_possible=%d quick=%u pingpong=%u", (sk->sk_num), ofo_possible, (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'tcp_send_delayed_ack(struct sock *sk) (sk->sk_dport == 3115) "%d quick=%u pingpong=%u", (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'__tcp_transmit_skb(struct sock *sk) (sk->sk_dport == 3115) "%d quick=%u pingpong=%u %u-%u<%u" (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong), ((u32)bpf_jiffies64()), (inet_csk(sk)->icsk_ack.lrcvtime), (inet_csk(sk)->icsk_ack.ato)' \
'tcp_update_skb_after_send(struct sock *sk) (sk->sk_dport == 3115) "%d quick=%u pingpong=%u", (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'__tcp_sock_set_quickack(struct sock *sk, int val) "%d %d", (sk->sk_num), val' \
'tcp_enter_quickack_mode(struct sock *sk, unsigned int max_quickacks) "%d %u", (sk->sk_num), max_quickacks' > 100-test-quickack-initcontainer-port-11020.txt


python3 /usr/share/bcc/tools/trace -tu \
-I 'net/sock.h' -I 'uapi/linux/ip.h' -I 'linux/tcp.h' -I 'net/inet_connection_sock.h' \
'tcp_rcv_established(struct sock *sk, struct sk_buff *skb) (sk->sk_dport == 64042) "%x %d quick=%u pingpong=%u", (((struct iphdr *)(skb->head + skb->network_header))->id), (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'tcp_event_data_recv(struct sock *sk, struct sk_buff *skb) (sk->sk_dport == 64042) "%x %d quick=%u pingpong=%u lrcvtime=%u ato=%u", (((struct iphdr *)(skb->head + skb->network_header))->id), (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong), (inet_csk(sk)->icsk_ack.lrcvtime), (inet_csk(sk)->icsk_ack.ato)' \
'tcp_send_ack(struct sock *sk) (sk->sk_dport == 64042) "%d lrcvtime=%u", (sk->sk_num), (inet_csk(sk)->icsk_ack.lrcvtime)' \
'__tcp_ack_snd_check(struct sock *sk, int ofo_possible) (sk->sk_dport == 64042) "%d ofo_possible=%d quick=%u pingpong=%u", (sk->sk_num), ofo_possible, (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'tcp_send_delayed_ack(struct sock *sk) (sk->sk_dport == 64042) "%d quick=%u pingpong=%u", (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'__tcp_transmit_skb(struct sock *sk) (sk->sk_dport == 64042) "%d quick=%u pingpong=%u %u-%u<%u" (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong), ((u32)bpf_jiffies64()), (inet_csk(sk)->icsk_ack.lrcvtime), (inet_csk(sk)->icsk_ack.ato)' \
'tcp_update_skb_after_send(struct sock *sk) (sk->sk_dport == 64042) "%d quick=%u pingpong=%u", (sk->sk_num), (inet_csk(sk)->icsk_ack.quick), (inet_csk(sk)->icsk_ack.pingpong)' \
'__tcp_sock_set_quickack(struct sock *sk, int val) "%d %d", (sk->sk_num), val' \
'tcp_enter_quickack_mode(struct sock *sk, unsigned int max_quickacks) "%d %u", (sk->sk_num), max_quickacks' > 100-test-quickack-initcontainer-port-11002.txt
>>>>>>> 3474737ac86aa1e7158f20b52a4e8d020cddd33b

