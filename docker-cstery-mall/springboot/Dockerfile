FROM openjdk:17
VOLUME /tmp
#ADD 后面的参数是项目名字 / 后面的参数是自定义的别名
ADD chengstery-mall-0.0.1-SNAPSHOT.jar /mall.jar
#这里的最后一个变量需要和前面起的别名相同
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/mall.jar"]
