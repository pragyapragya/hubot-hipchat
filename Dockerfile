# Example built from a couple of sources
FROM node
MAINTAINER Tim Hartmann <tfhartmann@gmail.com>

RUN apt-get update
RUN apt-get -y install wget python-dev g++ make libicu-dev redis-server python-pip

RUN npm install --global coffee-script yo generator-hubot hubot
# Create hubot user
RUN	useradd -d /opt/hubot -m -s /bin/bash -U hubot
# Log in as hubot user and change directory
USER	hubot
WORKDIR /opt/hubot
# Install hubot
RUN yo hubot --owner="You" --name="HuBot" --description="HuBot on Docker" --defaults
RUN npm install
RUN npm install --save git+https://github.com/hipchat/hubot-hipchat.git
ADD add-hubot-scripts.sh /tmp/
ADD add-external-scripts.py /tmp/

env   HUBOT_HIPCHAT_JID [asdfID]@chat.hipchat.com
env   HUBOT_HIPCHAT_PASSWORD [your-password]
env   HUBOT_AUTH_ADMIN [your name]

CMD redis-server /etc/redis/redis.conf && /tmp/add-hubot-scripts.sh && /tmp/add-external-scripts.py && bin/hubot --adapter hipchat
