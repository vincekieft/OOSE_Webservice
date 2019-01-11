FROM google/dart

WORKDIR /app

ADD pubspec.* /app/
RUN pub get
ADD . /app
RUN pub get --offline

CMD []

EXPOSE 3000

ENTRYPOINT ["/usr/bin/dart", "./bin/service.dart"]