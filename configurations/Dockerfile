FROM ubuntu:trusty

MAINTAINER wtf <wtf@wtf.com>

ENV DATABASE_NAME=r2d2
ENV DATABASE_USER=admin
ENV DATABASE_PASSWORD=r2myd2
ENV APP_PATH=/var/www/r2d2

# ---------------------------------------------------------------------
# ---------------------------------------------------------------------
# ----------------------APP INSTALLATION-------------------------------
# ---------------------------------------------------------------------
# ---------------------------------------------------------------------

RUN apt-get update
RUN apt-get install -y curl
RUN mkdir -p $APP_PATH
ADD . $APP_PATH
RUN chmod +x $APP_PATH/bin/install
RUN ./$APP_PATH/bin/install
WORKDIR $APP_PATH

#RUN useradd -ms /bin/bash app
#USER app

RUN useradd -ms /bin/bash azureuser
USER azureuser

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

RUN curl -L https://get.rvm.io | bash -s stable 

# Ajout rvm to PATH
#ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN /bin/bash -l -c 'rvm install 2.1.4'
RUN /bin/bash -l -c 'rvm use 2.1.4'
RUN /bin/bash -l -c 'gem install bundler --no-ri --no-rdoc'

USER root

RUN less $APP_PATH/default.conf > /etc/nginx/sites-enabled/default
RUN less $APP_PATH/nginx.conf > /etc/nginx/nginx.conf
RUN echo 'source /etc/profile.d/rvm.sh' >> /etc/profile

RUN mkdir -p $APP_PATH/tmp && touch $APP_PATH/tmp/restart.txt

RUN passenger-config validate-install
RUN nginx -t

# Reduce docker size
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN service postgresql start
RUN service nginx start

EXPOSE 3000
EXPOSE 443
EXPOSE 80 
