class ApplicationController < ActionController::Base
  def index
    @corporates = corporates.all.search(params[:corporates])
  end
end
