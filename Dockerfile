FROM ruby:2.5

LABEL maintainer="Guilherme Mascarenhas Barbosa <gmascb@gmail.com>"

ARG RAILS_ENV=development
ARG DEVELOPMENT_DATABASE_HOST=db
ARG DEVELOPMENT_DATABASE_USERNAME=postgres
ENV RAILS_ENV=${RAILS_ENV} \
    DEVELOPMENT_DATABASE_USERNAME=${DEVELOPMENT_DATABASE_USERNAME} \
    LANG=C.UTF-8 \
    DEVELOPMENT_DATABASE_HOST=${DEVELOPMENT_DATABASE_HOST}
    
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /docker-rails
WORKDIR /docker-rails
COPY Gemfile /docker-rails/Gemfile
COPY Gemfile.lock /docker-rails/Gemfile.lock
RUN bundle install
COPY . /docker-rails


# Add a script to be executed every time the containers starts.
COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# CMD ["rails", "s", "-b", "0.0.0.0"]
CMD bundle exec rails s -p 3000 -b '0.0.0.0'