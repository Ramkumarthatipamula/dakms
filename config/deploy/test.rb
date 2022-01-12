# # server-based syntax
# # ======================
# # Defines a single server with a list of roles and multiple properties.
# # You can define all roles on a single server, or split them:
#
# # server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
# # server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# # server "db.example.com", user: "deploy", roles: %w{db}
# server '3.108.73.220',user: 'deployer', roles: [:web, :app, :db], primary: true
# set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/eC2-University-test-server-pjtsau-university) }
#
# # set :puma_env, fetch(:rack_env, fetch(:rails_env, 'staging'))
#
# set :stage, :staging
#
# set :branch, 'payu_india'
#
# set :rails_env, 'staging'
#
# set :deploy_to, '/home/deployer/applications/skltshu_pg'
# set :linked_dirs, fetch(:linked_dirs, []).push('public/system')
#
# # set :rvm_ruby_version, 'ruby-2.7.2@pjtsau'
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
#   # after :finishing, 'sidekiq:stop'
#   # after :finishing, 'sidekiq:start'
#
#   # desc 'Load schema for the first time'
#   # task :load_schema do
#   #   on roles(:db) do
#   #     within release_path do
#   #       with rails_env: fetch(:rails_env) do
#   #         # execute :rake, "db:create"
#   #         # execute :rake, "db:schema:load"
#   #       end
#   #     end
#   #   end
#   # end
#
#   # lOAD SCHEMA BEFORE Migration
#   # before :migrate, :load_schema
#
#   # Data Seeding
#   # namespace :db do
#   #   desc 'Seeding initial essential data into database'
#   #   task :seed_initial_data do
#   #     on roles(:db) do
#   #       within release_path do
#   #         with rails_env: fetch(:rails_env) do
#   #           # execute :rake, 'db:seed_fu  FILTER=users,sunray_employees,user_accounts,states,state_request_type_due_date_rule_types'
#   #           # execute :rake, 'db:seed_fu'
#   #         end
#   #       end
#   #     end
#   #   end
#   # end
#
#   # desc 'Run Elastic Service'
#   # task :run_elastic do
#   #   on roles(:web), in: :sequence, wait: 5 do
#   #     execute  :service, 'elasticsearch', 'start'
#   #   end
#   # end
#
#   # after :restart, :run_elastic
#
#
#   # before 'deploy:publishing', 'deploy:db:seed_initial_data'
# end
#
#
# # role-based syntax
# # ==================
#
# # Defines a role with one or multiple servers. The primary server in each
# # group is considered to be the first unless any hosts have the primary
# # property set. Specify the username and a domain or IP for the server.
# # Don't use `:all`, it's a meta role.
#
# # role :app, %w{deploy@example.com}, my_property: :my_value
# # role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# # role :db,  %w{deploy@example.com}
#
#
#
# # Configuration
# # =============
# # You can set any configuration variable like in config/deploy.rb
# # These variables are then only loaded and set in this stage.
# # For available Capistrano configuration variables see the documentation page.
# # http://capistranorb.com/documentation/getting-started/configuration/
# # Feel free to add new variables to customise your setup.
#
#
#
# # Custom SSH Options
# # ==================
# # You may pass any option but keep in mind that net/ssh understands a
# # limited set of options, consult the Net::SSH documentation.
# # http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
# #
# # Global options
# # --------------
#  # set :ssh_options, {
#  #   keys: %w(/home/raj/.ssh/eC2-University-test-server-pjtsau-university.pem),
#  #   forward_agent: false,
#  #   auth_methods: %w(password)
#  # }
# #
# # The server-based syntax can be used to override options:
# # ------------------------------------
# # server "example.com",
# #   user: "user_name",
# #   roles: %w{web app},
# #   ssh_options: {
# #     user: "user_name", # overrides user setting above
# #     keys: %w(/home/user_name/.ssh/id_rsa),
# #     forward_agent: false,
# #     auth_methods: %w(publickey password)
# #     # password: "please use keys"
# #   }
#
# # namespace :deploy do
#
# #   after :restart, :clear_cache do
# #     on roles(:web), in: :groups, limit: 3, wait: 10 do
# #       # Here we can do anything such as:
# #       # within release_path do
# #       #   execute :rake, 'cache:clear'
# #       # end
# #     end
# #   end
#
# # end
