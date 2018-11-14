FROM ruby:2.5-alpine3.7
COPY ./ /app/
WORKDIR /app
RUN gem install bundler -v 1.14.0
RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  sqlite \
  sqlite-libs \
  sqlite-dev \
  nodejs \
  && rm -rf /var/cache/apk/*
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java
RUN bundle install
RUN apk add --update tzdata
RUN rake db:migrate
RUN rake db:setup
RUN rake assets:precompile
CMD ["bundle", "exec", "rails", "s"]