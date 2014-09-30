require "sinatra"

get "/" do
  File.read(File.join('public', 'index.html'))
end

get "/healthz" do
  "Remy is healthy"
end
