class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # is a short hand for protect_from_forgery ({:with => :exception})
  # <%= link_to "New Questions", new_questions_path %>

end
