class KillersController < ApplicationController

    get '/signup' do
        erb :'/killers/new'
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