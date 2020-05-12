class VictimsController < ApplicationController
    
    get '/victims' do
        @victims = Victim.all
        erb :'/victims/index'
    end

    get '/victims/new' do
        @killer = Killer.find_by_id([:id])
        #validate
        erb :'/victims/new'
    end

    post '/victims' do
        @victim = Victim.new(name: params[:victim_name], time_of_death: params[:time_of_death], last_words: params[:last_words])
        #validate
        if params[:victim_name] == "" || params[:time_of_death] == "" ||  params[:last_words] == ""
            redirect '/victims/new'
        else
        # @victim.killer_id = session[:user_id]
        @victim.save
        binding.pry
        redirect "/victims/#{@victim.id}"
        end
    end

    get '/victims/:id/edit' do
        @victims = Victim.find_by_id(params[:id])
        erb :'/victims/edit'
    end

    patch '/victims/:id' do
        @victims = Victim.find_by_id(params[:id])
        if @victims.update(name: params[:victim_name], time_of_death: params[:time_of_death], last_words: params[:last_words])
            redirect "/victims/#{@victims.id}"
        else
            redirect "/victims/#{@victims.id}/edit"
        end
    end

    get '/victims/:id' do
        @victims = Victim.find_by_id(params[:id])
        if @victims
            erb :'/victims/show'
        else
            redirect '/victims'
        end
    end

    delete '/victims/:id/delete' do
        @victims = Victim.find_by_id(params[:id])
        @victims.delete
        redirect to '/victims'
    end


    
end