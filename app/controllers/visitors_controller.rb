class VisitorsController < ApplicationController

  def index
    if user_signed_in?
      redirect_to patients_path
    end
  end

end