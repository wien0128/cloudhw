# OpneJDK 17 사용
FROM openjdk:21

# 이미지 메타데이터 정의 (유지관리자, 설명, 버전)
LABEL maintainer="wien0128" \
    description="Image for Cloudhw" \
    version="0.0.1"

# 컨테이너의 타임 존 = 아시아/서울
ENV TZ=Asia/Seoul

# JAR 파일 경로
ARG JAR_FILE=build/libs/cloudhw-0.0.1-SNAPSHOT.jar
# 컨테이너 내부로 JAR 복사
ADD ${JAR_FILE} cloudhw.jar

# 컨테이너 초기화 스크립트
ENTRYPOINT [ \
    "java", \
    "-jar", \
    "-Duser.timezone=${TZ}", \
    "cloudhw.jar" \
]