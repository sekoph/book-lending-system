class ApplicationController < ActionController::Base
  include Authentication
  # before_action: set_layout

  # def set_layout
    # if @layout = user_signed_in? ? "application" : "authentication"
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
