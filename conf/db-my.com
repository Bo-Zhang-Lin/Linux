$TTL          86400
$ORIGIN my.com.
@          1D IN SOA                    @ root.my.com. (
                                        2015041601          ; 修改序號
                                        3H                  ; refresh
                                        15M                 ; retry
                                        1W                  ; expiry
                                        1D )                ; minimum

@            IN NS         dns.my.com.
dns.my.com.  IN A          192.168.50.254

;設定 MX record
;@              IN MX 10      ms1
;@              IN MX 20      ms2
;ms1            IN A          11.22.33.69
;ms2            IN A          11.22.33.70

;www            10 IN A       11.22.33.85     ;www 做 load balancing
;www            10 IN A       11.22.33.86     ;www 做 load balancing
;web            IN CNAME      www             ;讓 web.abc.com.tw 也指到 www
gateway         IN A     192.168.50.1;
pxe             IN A     192.168.50.254;
host1           IN A     192.168.50.1;
host2           IN A     192.168.50.2;
host101         IN A     192.168.50.101;

