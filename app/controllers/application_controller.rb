class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_customers_path
    when Customer
      public_events_index_path
    end
  end
end
