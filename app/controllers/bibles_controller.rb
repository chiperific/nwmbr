class BiblesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]

  def home
  end

  def search
    # @search = params
    # do that search thing
    # if params['inclusion'] =
    # if params['case'] =

    @result = {content: "Good search!"}
  end

  def route_error
    flash[:alert] = "Sorry, that's not a real place."
    redirect_to root_path
  end

end
