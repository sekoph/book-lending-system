class ApplicationController < ActionController::Base
  include Authentication
  layout :set_layout

  private
  def set_layout
    authenticated? ? "application" : "authentication"
  end
end
