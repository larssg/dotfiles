fin () {
  if git rev-parse --verify origin/master &> /dev/null
  then
    git checkout master
  else
    git checkout main
  fi
  
  git pull
  
  if [ -e Gemfile.lock ]
  then
    bundle install
  fi

  if [ -e yarn.lock ]
  then
    nvm install .
    npm install -g yarn
    yarn install
  fi

  if [ -e Cargo.lock ]
  then
    cargo update
  fi
}

gst () {
  git status -sb
}

routes() {
  bundle exec rails routes | fzf
}