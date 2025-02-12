class ApplicationController < ActionController::Base
  # include Authentication
  before_action :require_login

  layout :set_layout

  private

  def set_layout
    controller_name == "sessions" || controller_name == "registrations" ? "auth" : "application"
  end
end
