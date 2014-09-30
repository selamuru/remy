require "sinatra"

get "/" do
  "Remy is online"
end

get "/healthz" do
  "Remy is healthy"
end

