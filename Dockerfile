FROM centos:centos7

#cleanup to enable systemd
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
    systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

#Install build environment dependencies
#RUN yum update -y && \
#    yum install -y epel-release make rpmbuild rpmdevtools git && \
#    yum clean all && \
#    mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS} && \
#    echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros



RUN yum -y install epel-release 
RUN yum -y install http://software.internet2.edu/rpms/el7/x86_64/latest/packages/perfsonar-repo-0.11-1.noarch.rpm
RUN yum clean expire-cache
    
    
RUN  yum -y install \
    perfsonar-archive \
    supervisor \
    net-tools \
    sysstat \
    tcpdump && \
    # clean up
    yum clean all && \
    rm -rf /var/cache/yum/*
     


    
CMD ["echo", "Welcome Perfsonar Archiver"]
CMD ["pwd"]

CMD ["/usr/sbin/init"]
