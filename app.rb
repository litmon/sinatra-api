require "sinatra"
require "sinatra/activerecord"
require "./models/post.rb"

get "/posts" do
  Post.all.to_json
end

get "/posts/:id" do
  Post.find(params[:id]).to_json
end

post "/posts" do
  json = JSON.parse(request.body.read)
  post = Post.new(json)
  if post.save
    { result: "success", code: 200 }.to_json
  else
    { result: "failure" }.to_json
  end
end
