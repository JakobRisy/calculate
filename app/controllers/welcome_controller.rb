class WelcomeController < ApplicationController
  def index
	@result = ''
  end
  def calculate
	@result = params[:f].to_i + params[:s].to_i
	render :action => :index
  end
end