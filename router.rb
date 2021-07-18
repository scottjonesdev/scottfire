require 'pry'

class Router
  def initialize
    @routes = []
  end

  def call(env)
    path = env["REQUEST_PATH"]
    @routes.each do |route|
      if route[:path] == path
        return respond_html(route[:block].call)
      end
    end
    respond_html("not found", status: 404)
  end

  def get(path, &block)
    @routes.push({ path: path, block: block })
  end

  private

  def respond_html(content, status: 200)
    [status, {'Content-Type' => 'text/html'}, [content]]
  end
end
