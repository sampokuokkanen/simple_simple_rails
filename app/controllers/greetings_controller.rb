class GreetingsController < ApplicationController
  def index
    render plain: "Hello, World!"
  end
end
