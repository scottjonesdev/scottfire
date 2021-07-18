require './router'

class Application
  def call(env)
    @router = Router.new
    @router.get("/hello") do
      "hello world"
    end
    @router.get("/time") do
      Time.now.to_s
    end
    @router.get("/dogs") do
      ["Phoebe", "Cuj"].to_s
    end
    @router.call(env)
  end
end
