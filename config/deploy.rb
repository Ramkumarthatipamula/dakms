lock '3.16.0'

set :application, 'dakms'
set :repo_url, 'git@github.com:Ramkumarthatipamula/dakms.git'
# set :repo_url, 'https://Ramkumarthatipamula:ramukumar.1392@github.com/Ramkumarthatipamula/skltshu_pg'
# set :scm, :git
# Do a single clone/checkout of your repository on your server the first time
set :deploy_via, :remote_cache
# server user name
set :user, 'deployer'
# creates a restart file
set :passenger_restart_with_touch, true
# Connect this session to a user terminal and start an interactive session(interactive login)
set :pty, false
set :use_sudo, false
# set :rvm_map_bins, %w{gem rake ruby rails bundle}
# set default shell as bash
set :default_shell, "/bin/bash -l"
# defines the RVM path to ~/.rvm
set :rvm_type, :user
# set :bundle_flags, '--deployment --verbose'

set :keep_releases, 3

# set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }

set :linked_files, [
    'config/database.yml'
   ]

set :linked_dirs, %w{log public/system}
append :linked_dirs, 'log', 'storage', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads', 'node_modules'

# sidekiq serach for given queue names
# set :sidekiq_queue, ['default', 'mailer', 'mailers']
# set :sidekiq_processes, 1
# SSHKit.config.command_map[:sidekiq] = "bundle exec sidekiq"
# SSHKit.config.command_map[:sidekiqctl] = "sidekiqctl"
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

   #--------------------PUMA Config------------------------------
# config valid for current version and patch releases of Capistrano
# lock "~> 3.16.0"

# set :application, "skltshu_pg"
# set :repo_url, "git@github.com:Ramkumarthatipamula/skltshu_pg.git"
# set :branch, :master
# set :deploy_to, '/home/deploy/skltshu_pg'
# set :pty, true
# set :linked_files, %w{config/database.yml config/application.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
# set :keep_releases, 3
# set :rvm_type, :user
# set :rvm_ruby_version, 'ruby-2.7.2' # Edit this if you are using MRI Ruby

# set :puma_rackup, -> { File.join(current_path, 'config.ru') }
# set :puma_state, "#{shared_path}/tmp/pids/puma.state"
# set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
# set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
# set :puma_conf, "#{shared_path}/puma.rb"
# set :puma_access_log, "#{shared_path}/log/puma_error.log"
# set :puma_error_log, "#{shared_path}/log/puma_access.log"
# set :puma_role, :app
# set :puma_threads, [0, 8]
# set :puma_workers, 0
# set :puma_worker_timeout, nil
# set :puma_init_active_record, true
# set :puma_preload_app, false

# # Default branch is :master
# # ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# # Default deploy_to directory is /var/www/my_app_name
# # set :deploy_to, "/var/www/my_app_name"

# # Default value for :format is :airbrussh.
# # set :format, :airbrussh

# # You can configure the Airbrussh format using :format_options.
# # These are the defaults.
# # set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# # Default value for :pty is false
# # set :pty, true

# # Default value for :linked_files is []
# # append :linked_files, "config/database.yml"

# # Default value for linked_dirs is []
# # append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# # Default value for default_env is {}
# # set :default_env, { path: "/opt/ruby/bin:$PATH" }

# # Default value for local_user is ENV['USER']
# # set :local_user, -> { `git config user.name`.chomp }

# # Default value for keep_releases is 5
# # set :keep_releases, 2

# # Uncomment the following to require manually verifying the host key before first deploy.
# # set :ssh_options, verify_host_key: :secure

# namespace :puma do
#   desc 'Create Directories for Puma Pids and Socket'
#   task :make_dirs do
#     on roles(:app) do
#       execute "mkdir #{shared_path}/tmp/sockets -p"
#       execute "mkdir #{shared_path}/tmp/pids -p"
#     end
#   end

#   before :start, :make_dirs
# end

# namespace :deploy do
#   desc "Make sure local git is in sync with remote."
#   task :check_revision do
#     on roles(:app) do
#       unless `git rev-parse HEAD` == `git rev-parse origin/master`
#         puts "WARNING: HEAD is not the same as origin/master"
#         puts "Run `git push` to sync changes."
#         exit
#       end
#     end
#   end

#   desc 'Initial Deploy'
#   task :initial do
#     on roles(:app) do
#       before 'deploy:restart', 'puma:start'
#       invoke 'deploy'
#     end
#   end

#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       invoke 'puma:restart'
#     end
#   end

#   before :starting,     :check_revision
#   after  :finishing,    :compile_assets
#   after  :finishing,    :cleanup
#   after  :finishing,    :restart
# end
