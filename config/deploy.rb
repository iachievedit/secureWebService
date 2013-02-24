require 'bundler/capistrano'

set :application, "secureWebService"
#set :repository,  "git@github.com:iachievedit/secureWebService"
set :repository,  "https://github.com/iachievedit/secureWebService"

set :scm, :git
set :deploy_via, :remote_cache

#role :web, "192.168.0.113"
role :app, "192.168.0.113"

after "deploy:restart", "deploy:cleanup"

task :development do
  set :user, "webservice"
  set :use_sudo, false
  set :stage, "development"
  set :branch, "master"
  set :deploy_to, "/web/apps/#{stage}/#{application}"
end

namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end
