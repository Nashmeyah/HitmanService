class SessionsController < ApplicationController

    get '/login' do
        if !logged_in?
            erb :'/sessions/login'
        else
            redirect '/victims'
        end
    end

    post '/login' do
        killer = Killer.find_by(email: params[:email])
        if killer && killer.authenticate(params[:password])
            session[:killer_id] = killer.id
            redirect :'/victims'
        else
            redirect :'/login'
        end
    end

    get '/logout' do
        session.clear
        redirect :'/login'
    end
end