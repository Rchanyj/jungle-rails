class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_AUTH_USER'], password: ENV['ADMIN_AUTH_PASS'], except: [:index, :show]

  def show
  end
end
