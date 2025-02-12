class ApplicationController < ActionController::Base
  include Authentication
  layout :set_layout
  

  private
  def set_layout
    authenticated? ? "application" : "authentication"
  end

  # def authenticated_user!
  #   unless user_signed_in?
  #     redirect_to new_session_path, alert: "You must be logged in to access that page."
  #   end
  # end

  

  # def user_signed_in?
  #   Current.session ||= find_session_by_cookie
  # end

  # def find_session_by_cookie
  #   Session.find_by(id: cookies.signed[:session_id]) if cookies.signed[:session_id]
  # end

end
