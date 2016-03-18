class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter lambda {
    if request.session['cas'] && request.session['cas']['extra_attributes']
      extra_attributes = request.session['cas']['extra_attributes']
      user_info = extra_attributes['user_info']
      @current_user = Profile.where(email: user_info['email']).first

      # All new users will have a profile automatically created
      if @current_user.blank?
        Profile.create!(
          name: user_info['name'],
          email: user_info['email']
        )

        # Set new_user param to be true, to provide initial setup
        params[:new_user] = true
      end
    else
      render :nothing => true, :status => :unauthorized
    end
  }
end
