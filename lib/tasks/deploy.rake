namespace :deploy do

  desc 'Deploy to staging'
  task :staging do
    app = "treefinger-staging"
    remote = "git@heroku.com:#{app}.git"
    system "heroku maintenance:on --app #{app}"
    system "git push -f #{remote} master"
    system "heroku run rake db:migrate --app #{app}"
    system "heroku maintenance:off --app #{app}"
    system 'git checkout master'
    system 'curl -i treefinger-staging.herokuapp.com'
  end

end
