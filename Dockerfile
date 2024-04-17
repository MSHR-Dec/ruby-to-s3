FROM ruby:3.0.6

WORKDIR /myapp

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

ENTRYPOINT ["rake", "--trace"]
CMD ["-T"]
