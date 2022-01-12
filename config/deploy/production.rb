# # server-based syntax
# # ======================
# # Defines a single server with a list of roles and multiple properties.
# # You can define all roles on a single server, or split them:
#
# # server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
# # server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# # server "db.example.com", user: "deploy", roles: %w{db}
# # server '202.65.131.220',user: 'deployer', roles: [:web, :app, :db], primary: true
# # set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_ed25519) }
# # The server-based syntax can be used to override options:
# # ------------------------------------
# server '3.108.73.220',user: 'deployer', roles: [:web, :app, :db], primary: true
#
# set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/eC2-University-test-server-pjtsau-university) }
#
# set :branch, 'payu_india'
# set :rails_env, 'production'
# set :deploy_to, '/home/deployer/applications/skltshu_pg'
# set :linked_dirs, fetch(:linked_dirs, []).push('public/system')
#
#
# # Task to update the remote repository url. (in case you change it;
# # Capistrano does not automatically handle this type of change).
# namespace :git do
#   task :update_repo_url do
#     on roles(:all) do
#       within repo_path do
#         execute :git, 'remote', 'set-url', 'origin', fetch(:repo_url)
#       end
#     end
#   end
# end
#
# namespace :deploy do
#   desc 'Restart application'
#   task :restart do
#     on roles(:web), in: :sequence, wait: 5 do
#       execute :mkdir, '-p', "#{release_path}/tmp"
#       execute :touch, release_path.join('tmp/restart.txt')
#     end
#   end
#
#   after :publishing, :restart
#
#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#     end
#   end
#
# end
