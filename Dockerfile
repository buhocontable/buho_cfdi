FROM ruby:2.6.10-alpine

# Install system dependencies needed for building gems
RUN apk add --no-cache \
    build-base \
    git \
    libxml2-dev \
    libxslt-dev \
    zlib-dev \
    gcompat

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock first for better caching
COPY Gemfile Gemfile.lock buho_cfdi.gemspec ./

# Copy version file as it's required by gemspec
COPY lib/buho_cfdi/version.rb ./lib/buho_cfdi/

# Install bundler and gems
RUN gem install bundler -v 2.2.4
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle config force_ruby_platform true
RUN bundle install

# Copy the rest of the application
COPY . .

# Default command to run specs
CMD ["bundle", "exec", "rspec"]
