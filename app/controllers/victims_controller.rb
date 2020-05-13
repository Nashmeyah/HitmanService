class VictimsController < ApplicationController
    
    get '/victims' do
        if logged_in?
        @victims = current_killer.victims
        erb :'/victims/index'
        else
            redirect :'/login'
        end
    end

    get '/victims/new' do
        if logged_in?
            erb :'/victims/new'
        else
            redirect :'/login'
        end
    end 

    post '/victims' do
        if logged_in?
            @victim = current_killer.victims.build(params)
            if !blank?
                @victim.save
                redirect "/victims/#{@victim.id}" 
            else
                redirect '/victims/new'
            end
            redirect '/login'
        end
    end

    get '/victims/:id/edit' do
        if logged_in?
            @victims = current_killer.victims.find_by_id(params[:id])
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
            @victims = current_killer.victims.find_by_id(params[:id])
                if @vicitms
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

    get '/victims/:id' do
        if logged_in?
            @victims = current_killer.victims.find_by_id(params[:id])
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
            @victims = current_killer.victims.find_by_id(params[:id])
                if @victims
                    @victims.delete
                else
                    redirect to '/victims'
                end
        else
            redirect '/login'
        end
    end


    
end