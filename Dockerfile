FROM ubuntu:latest
RUN apt-get update \
  && apt-get install ca-certificates wget curl -y
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
CMD /configure.sh
