FROM ubuntu

RUN apt update
RUN apt upgrade -y
# according to https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
RUN apt install -y sudo ca-certificates curl gnupg
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN sudo chmod a+r /etc/apt/keyrings/docker.gpg
RUN echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt update
RUN apt install -y docker-ce-cli docker-compose-plugin

# other stuff
RUN apt install -y git
RUN apt install -y openssh-server
RUN apt install -y fish nmap
RUN apt install -y neovim
RUN apt install -y cron make

RUN echo 'ha\nha' | passwd
RUN echo PermitRootLogin yes >> /etc/ssh/sshd_config

COPY entrypoint.sh /bin/
RUN chmod +x /bin/entrypoint.sh
RUN chsh -s /usr/bin/fish 
ENTRYPOINT [ "/bin/entrypoint.sh" ]