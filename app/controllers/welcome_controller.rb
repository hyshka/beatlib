class WelcomeController < ApplicationController
  def index
    @beats = Beat.all
  end
end
