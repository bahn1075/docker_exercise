# Rocky Linux 최신 이미지 사용
FROM rockylinux:9-minimal

# 환경 변수 설정
ENV MYSQL_ROOT_PASSWORD=vkfrhd33

# 필수 패키지 설치 및 MySQL 리포지토리 추가
RUN dnf -y update && \
    dnf -y install dnf-utils && \
    dnf config-manager --add-repo=https://repo.mysql.com/mysql80-community-release-el9.rpm && \
    dnf -y install mysql-server && \
    dnf clean all

# MySQL 포트 노출
EXPOSE 3306

# 데이터 디렉토리 생성 및 권한 설정
RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

# MySQL 데몬 실행
CMD ["mysqld"]
