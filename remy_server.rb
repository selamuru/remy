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
  erb :index
end

get "/healthz" do
  "Remy is healthy"
end

get "/dish/:name" do
  dishes = Menus.match(name: params[:name])
  dishes.raw_plain["hits"]["hits"].map { |dish| dish["_source"] }.to_json
  #slim :index, local: { menus: Menus.match(name: params[:word])}
end

#__END__
#@@ layout
#doctype html
#html
#  body== yield

# @@ index
# h1= "#{menus.total} dishes matching “#{params[:name]}”"
# ul
#   - menus.results.each do |dish|
#     li= dish.name
