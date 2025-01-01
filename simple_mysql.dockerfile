# Rocky Linux 최신 9 버전 이미지 사용
FROM rockylinux:9

# 환경 변수 설정
ENV MYSQL_ROOT_PASSWORD=vkfrhd33

# 필수 패키지 설치 및 MySQL 리포지토리 추가
RUN dnf -y update && \
    dnf -y install wget && \
    wget https://repo.mysql.com/mysql80-community-release-el9.rpm && \
    dnf -y install mysql80-community-release-el9.rpm && \
    dnf -y install mysql-server && \
    dnf clean all

# MySQL 포트 노출
EXPOSE 3306

# MySQL 데이터 디렉토리 및 권한 설정
RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

# MySQL 사용자로 실행
USER mysql

# MySQL 데몬 실행
CMD ["mysqld"]