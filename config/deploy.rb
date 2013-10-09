require 'bundler/capistrano'

set :application, "wedding_list"
set :repository,  "https://github.com/rarodriguez/wedding_list"

set :deploy_to, "/var/www/apps/wedding_list"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

default_run_options[:pty] = true
set :keep_releases, 5
set :rails_env, "production"
set :deploy_via, :copy
set :use_sudo, false
set :user, "root"

role :web, "108.166.77.118"                          # Your HTTP server, Apache/etc
role :app, "108.166.77.118"                          # This may be the same as your `Web` server
role :db,  "108.166.77.118", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", "deploy:create_symlink"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  desc "Make symlink for database yaml"
  task :create_symlink do
    run "ln -nfs #{shared_path}/database.yml #{latest_release}/config/database.yml"
  end
end