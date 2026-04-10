$TTL 3600
@       IN      SOA     ns1.federationofdaf.com. admin.federationofdaf.com. (
                        2026041001      ; Serial (YYYYMMDDNN format)
                        3600            ; Refresh (1 hour)
                        1800            ; Retry (30 minutes)
                        604800          ; Expire (7 days)
                        3600            ; Minimum TTL (1 hour)
                        )

; Nameservers
@       IN      NS      ns1.federationofdaf.com.

; A Records - Point to your server's IP address in internal network
; Replace 192.168.0.10 with your actual server IP
ns1     IN      A       192.168.0.10
@       IN      A       192.168.0.10

; Service-specific A Records
auth            IN      A       192.168.0.10
traefik         IN      A       192.168.0.10
homepage        IN      A       192.168.0.10
authentik       IN      A       192.168.0.10
crowdsec        IN      A       192.168.0.10
bind9           IN      A       192.168.0.10

; Service-specific SRV Records (optional, for service discovery)
; Format: _service._proto.name. TTL IN SRV priority weight port target.

; Aliases (CNAME) - Optional, for easier service access
auth-admin      IN      CNAME   auth.federationofdaf.com.
dashboard       IN      CNAME   traefik.federationofdaf.com.