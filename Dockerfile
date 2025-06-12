FROM ruby:3.3.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn sqlite3

WORKDIR /app

# ENV RAILS_ENV=production

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 8080

CMD ["bash", "-c", "bin/rails server -b 0.0.0.0 -p 8080"]
