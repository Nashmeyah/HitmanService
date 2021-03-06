class VictimsController < ApplicationController
    
    get '/victims' do  #index
        if logged_in?
        @victims = current_killer.victims
        erb :'/victims/index'
        else
            redirect :'/login'
        end
    end

    get '/victims/new' do  #new
        if logged_in?
            erb :'/victims/new'
        else
            redirect :'/login'
        end
    end 

    post '/victims' do
        if logged_in?
            @victim = current_killer.victims.build(params)
            
            if @victim.save
                redirect "/victims/#{@victim.id}" 
            else
                erb :'/victims/new'
            end
        else
            redirect '/login'
        end
    end
    
    get '/victims/:id/edit' do #edit
        if logged_in?
            set_victim
                if @victims
                    erb :'/victims/edit'
                else
                    redirect '/victims'
                end
        else
            redirect '/login'
        end
    end

    patch '/victims/:id' do
        if logged_in?
            set_victim
                if @victims
                    if @victims.update(name: params[:victim_name], time_of_death: params[:time_of_death], last_words: params[:last_words])
                        redirect "/victims/#{@victims.id}"
                    else
                        redirect "/victims/#{@victims.id}/edit"
                    end
                else
                    redirect '/victims'
                end 
        else
            redirect '/login'
        end
    end

    get '/victims/:id' do  #show
        if logged_in?
            set_victim
                if @victims
                    erb :'/victims/show'
                else
                    redirect '/victims'
                end
        else
            redirect '/login'
        end
    end

    delete '/victims/:id' do
        if logged_in?
            set_victim
                if @victims
                    @victims.delete
                end
                redirect to '/victims'
        else
            redirect '/login'
        end
    end

    helpers do 
        def set_victim
            @victims = current_killer.victims.find_by_id(params[:id])
        end
    end
    
end