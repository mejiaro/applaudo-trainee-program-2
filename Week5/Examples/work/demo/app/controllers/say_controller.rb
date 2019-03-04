class SayController < ApplicationController
  def hello
    @time = Time.zone.now
    @files = Dir.glob('*')
  end

  def goodbye; end
end
