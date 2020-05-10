class VictimsController < ApplicationController
    
    get '/victims' do
        @victims = Victim.all
        erb :'/victims/index'
    end

    get '/victims/new' do
        erb :'/victims/new'
    end

    post '/victims' do
        binding.pry
    end

    get '/victims/:id' do
        @victims = Victim.find_by_id(params[:id])
        if @victims
            erb :'/victims/show'
        else
            redirect '/victims'
        end
    end


    
end