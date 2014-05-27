# config valid only for Capistrano 3.1
lock '3.2.0'

set :stage, :production
set :rails_env, :production

set :application, 'TODOforME'
set :full_app_name, 'TODOforME'
set :deploy_user, 'devteam'

set :deploy_to, "/home/devteam/TODOforME"

set :repo_url, 'git@github.com:ITStorm61/highfive.git'

set :scm, :git
set :keep_releases, 2

after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end