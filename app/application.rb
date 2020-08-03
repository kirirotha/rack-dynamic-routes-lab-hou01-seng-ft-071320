#require_relative './item.rb'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/#{item.name})
        resp.write "#{item.price}\n"
        resp.status 200
    else
      resp.write "Path not found"
      resp.status = 404
  end


end
