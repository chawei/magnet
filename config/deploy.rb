require 'bundler/capistrano'

# This will specify the rvm version
require 'rvm/capistrano'

set :rvm_type, :system
set :rvm_ruby_string, 'ruby-1.8.7-p302@magnet' # Defaults to 'default'

# http://blog.futureshock-ed.com/2009/05/draft-deploying-ruby-on-rails-app-to.html

#############################################################
# This file is designed as a starting point to use
# capistrano to deploy the trunk of tracks to a webhost
# where it is served using Phusion Passenger. For more
# info on getting started with Passenger, see
# http://www.modrails.com/
#############################################################

#############################################################
# Servers
#############################################################

set :user, "rails3-deployer"
set :domain, "dearstudio.com"
server domain, :app, :web
role :db, domain, :primary => true

#############################################################
# Application
#############################################################

set :application, "magnet-production"
set :deploy_to, "/home/#{user}/apps/#{application}"

#############################################################
# Settings
#############################################################

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :use_sudo, false
set :scm_verbose, true
set :rails_env, "production"

# Less releases, less space wasted
set :keep_releases, 5

#############################################################
# Git
#############################################################

set :scm, :git
set :branch, "master"
set :repository, "git@github.com:chawei/magnet.git"
set :deploy_via, :remote_cache
# If you have public like github.com then use :remote_cache
# set :deploy_via, :copy  # if you server does NOT have direct access to the repository (default)  

#############################################################
# Passenger
#############################################################

namespace :deploy do
  desc "Deploy with Migrations"
  task :default do
    set :migrate_target, :latest
    update_code
    migrate
    symlink
    restart
  end
  
  desc "Symlink config files and db"
  task :before_symlink do
    #run "rm #{release_path}/public/.htaccess" #not compatible with Passenger
    run "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    #run "ln -s #{shared_path}/config/environment.rb #{release_path}/config/environment.rb"
  end

  # Restart passenger on deploy
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  desc "Create SQLite db in shared folder"
  task :create_db do
    run "rake db:create"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

#before "deploy:cold", "deploy:create_db"

namespace :db do
  desc "Dumps the #{rails_env} database to db/#{rails_env}_data.sql on the remote server"
  task :remote_db_dump, :roles => :db, :only => { :primary => true } do
    run "cd #{deploy_to}/#{current_dir} && " +
        "rake RAILS_ENV=#{rails_env} db:dump_sql --trace"
  end

  desc "Downloads db/#{rails_env}_data.sql from the remote #{rails_env} environment to your local machine"
  task :remote_db_download, :roles => :db, :only => { :primary => true } do 
    execute_on_servers(options) do |servers|
      self.sessions[servers.first].sftp.connect do |tsftp|
        tsftp.download!("#{deploy_to}/#{current_dir}/db/#{rails_env}_data.sql", "db/#{rails_env}_data.sql")
      end
   end
  end

  desc 'Cleans up data dump file'
  task :remote_db_cleanup, :roles => :db, :only => { :primary => true } do
    execute_on_servers(options) do |servers|
      self.sessions[servers.first].sftp.connect do |tsftp|
        tsftp.remove! "#{deploy_to}/#{current_dir}/db/#{rails_env}_data.sql"
      end
   end
  end

  desc "Dump, download and then clean up the #{rails_env} data dump"
  task :remote_db_runner do
    remote_db_dump
    remote_db_download
    remote_db_cleanup
  end
end