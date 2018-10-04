class WelcomePageController < ApplicationController
  before_action :authenticate_user!

    def home
   @requests = Request.all
  
    @conversations = Conversation.includes(:request, :messages)
                                 .find(session[:conversations])
  end

def index
end
  def location
  end
end
def stats

end
