# OpenVPN LDAP

## Pre-reqs

```
export OVPN_SERVER_CN=vpn.example.com
export LDAP_URI=ldaps://ldap.example.com:636
export LDAP_BASE_DN=ou=Users,example,dc=com
export LDAP_BIND_USER_DN=uid=myuser,ou=Users,dc=example,dc=com
export LDAP_BIND_USER_PASS=password
export LDAP_FILTER=memberOf=cn=foo,ou=Users,dc=example,dc=com
```

Make sure OVPN_SERVER_CN is reachable by dns or /etc/hosts:

```
$ tail -n 1 /etc/hosts
127.0.0.1 vpn.example.com
```



## Usage
`docker-compose build && docker-compose up`

Once you see `openvpn-ldap | Mon Feb  4 18:50:02 2019 us=455434 Initialization Sequence Completed`, 
open a new terminal and run:

`docker exec -ti openvpn-ldap show-client-config >foo.ovpn`
then: `sudo openvpn --config foo.ovpn`
