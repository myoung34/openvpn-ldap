FROM centos:6.8
#FROM amazonlinux:2018.03

RUN yum -y install epel-release iptables bash nss-pam-ldapd ca-certificates
RUN yum -y install --enablerepo="epel*" openvpn whatmask fail2ban

EXPOSE 1194/udp

ADD ./files/bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

ADD ./files/configuration /opt/configuration

# Copy openvpn PAM modules (with and without OTP)
ADD ./files/etc/pam.d/openvpn* /opt/
ADD ./files/easyrsa /opt/easyrsa

# google authenticator
ADD ./files/google-authenticator/lib64/security/pam_google_authenticator.so /lib64/security/pam_google_authenticator.so
ADD ./files/google-authenticator/usr/bin/google-authenticator /usr/bin/google-authenticator

# Use a volume for data persistence
VOLUME /etc/openvpn

CMD ["/usr/local/bin/entrypoint"]
