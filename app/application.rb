#require_relative './item.rb'
require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    binding.pry
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{ |m| m.name = item_name}
      resp.write item.price
      resp.status = 200
    else
      resp.write "Path not found"
      resp.status = 404
    end
  end


end
