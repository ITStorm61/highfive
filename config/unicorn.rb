worker_processes 1

working_directory "/home/devteam/TODOforME/current"


listen "/home/devteam/TODOforME/shared/tmp/sockets/unicorn.sock", :backlog => 64

timeout 30

pid "/home/devteam/TODOforME/shared/tmp/pids/unicorn.pid"

stderr_path "/home/devteam/TODOforME/shared/log/unicorn.stderr.log"
stdout_path "/home/devteam/TODOforME/shared/log/unicorn.stdout.log"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true
# fast LAN.
check_client_connection false

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
