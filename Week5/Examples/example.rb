require 'rack'
# Class for the example
class MyApplication
  def call(_env)
    body = '<h1> Primer Ejercicio</h1>'\
            '<p> Rack is easy to use </p>'
    [200, { 'Content-Type' => 'text/html' }, [body]]
  end
end
