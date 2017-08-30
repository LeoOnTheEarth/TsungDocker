FROM centos:7

RUN cd /tmp && \
    yum install wget epel-release -y && \
    wget https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm && \
    rpm -Uvh erlang-solutions-1.0-1.noarch.rpm && \
    yum install erlang php perl perl-RRD-Simple.noarch perl-Log-Log4perl-RRDs.noarch gnuplot perl-Template-Toolkit -y && \
    wget http://tsung.erlang-projects.org/dist/tsung-1.6.0.tar.gz && \
    tar xfz tsung-1.6.0.tar.gz && \
    cd tsung-1.6.0 && \
    ./configure && \
    make && \
    make install && \
    cd /tmp && \
    rm -rf tsung-* && \
    yum clean all

EXPOSE 8091

ENTRYPOINT ["tsung"]
