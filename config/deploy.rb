set :application, "secureWebService"
set :repository,  "git@github.com:iachieved/secureWebService"

set :scm, :git

role :web, "192.168.0.113"

after "deploy:restart", "deploy:cleanup"

task :development do
  set :user, "webservice"
  set :use_sudo, true
  set :stage, "development"
  set :branch, "development"
  set :deploy_to, "/web/apps/#{stage}/#{application}"
end

namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end
