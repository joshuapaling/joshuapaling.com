require "bundler/capistrano"

require "rvm/capistrano"
#set :rvm_ruby_string, :local # from https://github.com/wayneeseguin/rvm-capistrano
set :rvm_type, :system # from http://stackoverflow.com/questions/5253153/rvm-error-with-deploying-rails-app-via-capistrano

#default_run_options[:shell] = '/bin/bash --login'

set :application, "joshua_paling_blog"
set :repository,  "ssh://git@bitbucket.org/bbldigital/joshuapaling.com.git"

set :default_environment, {
  'PATH' => "/usr/pgsql-9.2/bin/:$PATH" # so we can see pg_config. Suggestion from http://www.pastbedti.me/2011/06/change-path-environment-with-rails-and-capistrano/
}

set :scm, :git
ssh_options[:forward_agent] = true
default_run_options[:pty] = true
set :deploy_via, :remote_cache
set :copy_exclude, [ '.git' ] # from https://makandracards.com/makandra/1180-speed-up-capistrano-deployments-using-a-remote-cached-copy-of-repository
set :user, "joshua.paling" # To set up deploy user, follow instructions at http://www.capistranorb.com/documentation/getting-started/authentication-and-authorisation/ but if you already have an id_rsa in ~/.ssh, no need to create a new one - use the same one.
set :deploy_to, "/var/www/vhosts/joshuapaling.com/httpdocs/"
set :use_sudo, false # deploy user will need the right permissions so we don't have to use sudo to create files / folders etc

role :web, "joshuapaling.com"                          # Your HTTP server, Apache/etc
role :app, "joshuapaling.com"                          # This may be the same as your `Web` server
role :db,  "joshuapaling.com", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
set :keep_releases, 3
after "deploy:restart", "deploy:cleanup"

# from http://stackoverflow.com/questions/1449836/how-to-manage-rails-database-yml and http://stackoverflow.com/questions/9684649/capistrano-cant-deploy-my-database-yml
before 'deploy:assets:precompile', 'deploy:symlink_db'
namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:migrate'

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after :deploy, 'deploy:link_dependencies'
namespace :deploy do
  desc ""
  task :link_dependencies, :roles => :app do
    # future - link other uploaded files not kept in git here. See this method in sneakerology's deploy.rb file for an example.
  end
end