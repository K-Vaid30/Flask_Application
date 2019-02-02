FROM docker:dind

RUN set -x \
  && apk update \
  && apk add openssh git \
  && ssh-keygen -A \
  && mv /usr/local/bin/docker /usr/bin/docker \
  && git config --system user.email "vaidkunal.kv@gmail.com" \
  && git config --system user.name "K-Vaid30"

ADD ./sshd_config /etc/ssh/sshd_config
ADD ./entrypoint.sh /usr/local/bin/entrypoint

ENTRYPOINT [ "entrypoint" ]
