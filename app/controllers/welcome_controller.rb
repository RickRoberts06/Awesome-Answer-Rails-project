class WelcomeController < ApplicationController

  # to define an action in the controller we simply frginr an define method
  #inside this controller class
  def index
    #this will simply render test to the screen with no html
    #render text: "welcome to My rails app"

    #this will  render a template (in this case a ERB template)
    #render :index, layout: "application"
    # The line above is a shortcut for --> render(:index, {layout: "application"})
    # which is the default setting, that's why irrelevant
    def hello
      @name = params[:name]
      @city = params[:city]
      #this will render views/welcome/hello.html.erb
    end
  end

end
