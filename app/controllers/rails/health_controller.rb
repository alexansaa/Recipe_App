# app/controllers/rails/health_controller.rb

class Rails::HealthController < ApplicationController
  def show
    render plain: "OK"
  end
end
