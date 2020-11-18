FROM mcr.microsoft.com/vscode/devcontainers/ruby:2.7

# Install Ruby
RUN su vscode -c "source /usr/local/rvm/scripts/rvm && rvm install 2.7.2 2>&1"

# Install Node.js
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install 14.13.1 2>&1"

# Install additional Ruby gems
RUN su vscode -c "source /usr/local/rvm/scripts/rvm && gem install rails webdrivers solargraph"

# Install additional OS packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends postgresql

# Create a .env file
RUN echo "SECRET_KEY_BASE=$(bundle exec rails secret)" > .env
