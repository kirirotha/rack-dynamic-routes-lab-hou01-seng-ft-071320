require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    #binding.pry
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{ |m| m.name = item_name}
      binding.pry

      if @@items.include?(item)
        resp.write item.price
        resp.status = 200
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    #binding.pry
    resp.finish
  end


end
