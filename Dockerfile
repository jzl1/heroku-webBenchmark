FROM ubuntu:latest
RUN apt-get update \
  && apt-get install apt-utils \
  && apt-get install ca-certificates wget curl unzip -y
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
CMD /configure.sh
