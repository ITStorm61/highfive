set :stage, :production
set :branch, "master"

set :deploy_to, "/home/#{fetch(:deploy_user)}/#{fetch(:full_app_name)}"
set :rails_env, :production
set :unicorn_worker_count, 5
set :enable_ssl, false

role :app, %w{devteam@194.58.98.152}
role :web, %w{devteam@194.58.98.152}
role :db,  %w{devteam@194.58.98.152}

server '194.58.98.152', user: 'devteam', roles: %w{web app}, primary: true

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads}

set :unicorn_pid, "#{fetch(:deploy_user)}/shared/tmp/pids/unicorn.pid"
set :unicorn_config_path, "#{fetch(:deploy_user)}/current/config/unicorn.rb"
set :unicorn_rack_env, "production"