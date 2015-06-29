class DashboardController < ApplicationController
  def index
    if current_user.present?
      redirect_to admin_path
    end
  end
end
