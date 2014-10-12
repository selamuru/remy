require "sinatra"
require "stretcher"
require "slim"

class Menus
  @es = Stretcher::Server.new("http://localhost:9200")

  def self.match(name: "elasticsearch", size: 100)
    @es.index(:menus).search size: size, query: { term: { name: name } }
  end
end

before do
  @json_logs = {}
end

after do
  env["json_logs"] = @json_logs
end

get "/" do
  File.read(File.join('public', 'index.html'))
end

get "/healthz" do
  "Remy is healthy"
end

get "/dish/:name" do
  dishes = Menus.match(name: params[:name])
  dishes.raw_plain["hits"]["hits"].map { |dish| dish["_source"] }.to_json
end
