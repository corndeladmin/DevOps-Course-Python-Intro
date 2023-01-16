FROM python:3.10

RUN apt-get update && apt-get install ruby-full build-essential -y
RUN gem install jekyll bundler
WORKDIR /srv/jekyll
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
COPY entrypoint.sh ./entrypoint.sh
ENV PORT=4000
ENTRYPOINT ["bash", "entrypoint.sh"]