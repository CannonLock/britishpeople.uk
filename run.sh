PORT=8004

eval "$(rbenv init - bash)"

rbenv global 2.6.8

bundle install

bundle exec jekyll serve --trace --watch --config _config.yml -H 0.0.0.0 -P $PORT