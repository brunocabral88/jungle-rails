class Admin::AdminController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_PAGES_USERNAME'], password: ENV['ADMIN_PAGES_PASSWORD']
end
