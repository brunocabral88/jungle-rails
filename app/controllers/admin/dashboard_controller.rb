class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_PAGES_USERNAME'], password: ENV['ADMIN_PAGES_PASSWORD']
  
  def show
  end
end
