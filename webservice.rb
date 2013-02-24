require 'sinatra'
require 'json'

get '/resource/:id' do
  resource_id = params[:id]

  content_type :json
  {resource:  "#{resource_id}",
   status:    "OK",
   values:   {key1:  "value1",
              key2:  "value2"}}.to_json
end
