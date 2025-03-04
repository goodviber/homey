class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user

  def current_user
    # For the sake of this example, we'll just return the first user.
    @current_user ||= User.first
  end
end
