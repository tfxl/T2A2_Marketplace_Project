class ApplicationController < ActionController::Base

  include DeviseParams # a module so that attributes first_name and phone are included

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :no_access
  
  private

  def no_access

    flash[:alert] = "Sorry, you do not appear authorised to go there!"
  
    redirect_to(request.referrer || root_path)
    # return to previous URL or to home page

  end

end
