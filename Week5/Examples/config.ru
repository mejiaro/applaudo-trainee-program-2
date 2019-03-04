require_relative 'example'

@app = MyApplication.new
use Rack::Reloader, 0
run @app
