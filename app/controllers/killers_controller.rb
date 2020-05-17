class KillersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'/killers/new'
        else
            redirect '/victims'
        end
    end

    post '/signup' do
        
        @killer = Killer.new(params)
        
        if @killer.save
            
            redirect '/victims'
            
        else
            erb :'/killers/new'
            
        end
        
    end
end