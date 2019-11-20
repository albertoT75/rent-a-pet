class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard]
  def home
  end

  def dashboard
    @rents_owned = current_user.rents_as_owner
    @rents = current_user.rents
    # raise
  end
end

