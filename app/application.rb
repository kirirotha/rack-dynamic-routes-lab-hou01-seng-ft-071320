require_relative './item.rb'

class application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
          @@items.each do |item|
            resp.write "#{item}\n"
          end
        resp.status 200
    else
      resp.write "Path not found"
      resp.status = 404
  end


end
