class WelcomeController < ApplicationController

  layout 'application_black', :only => [:black, :other]

  def index
    @name = 'João Lucas'
  end

  def black
    
  end


end