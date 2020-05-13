require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "lilac"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!session[:killer_id]
    end

    def current_killer
      @killer ||= Killer.find_by_id(session[:killer_id]) if logged_in?
    end
  end

end
