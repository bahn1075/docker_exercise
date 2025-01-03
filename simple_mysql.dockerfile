# 기본 이미지 설정 (Alpine Linux)
FROM alpine:latest

# MySQL 설치를 위한 패키지 관리자 설정
RUN apk add --no-cache mysql-client mysql-server

# MySQL 데이터 디렉토리 생성
RUN mkdir -p /var/lib/mysql

# MySQL 초기화 스크립트 실행
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# MySQL 환경 설정 (root 비밀번호 변경 등)
ENV MYSQL_ROOT_PASSWORD=your_strong_password
# 다른 환경 변수 추가 가능 (예: MYSQL_DATABASE, MYSQL_USER, MYSQL_PASSWORD)

# MySQL 서비스 시작
CMD ["mysqld"]
