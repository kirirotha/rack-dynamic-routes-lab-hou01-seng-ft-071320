#require_relative './item.rb'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

     this_thing = req.params["item"]

    if req.path.match(/items/this_thing.name)
        resp.write "#{this_thing.price}\n"
        resp.status 200
    else
      resp.write "Path not found"
      resp.status = 404
    end
  end


end
