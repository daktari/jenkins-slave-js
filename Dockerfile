FROM      ubuntu
MAINTAINER Javier Heredia <jheredia1984@gmail.com>

# Install dependencies
RUN apt-get update
RUN apt-get -y install git curl gnupg2 build-essential nodejs npm
RUN ln -s "$(which nodejs)" /usr/bin/node

# Install grunt and bower packages
RUN npm install -g grunt-cli
RUN npm install -g bower

# Install ruby and compass packages
RUN gpg2 --keyserver hkp://keys.gnupg.net:80 --recv-keys D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby
RUN /bin/bash -c "source /usr/local/rvm/scripts/rvm; gem install compass"