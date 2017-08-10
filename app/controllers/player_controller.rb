class PlayerController < ApplicationController

  get '/player/new' do
    if is_logged_in?
      erb :'player/new'
    else
      redirect "/"
    end
  end

  post '/player' do
    if is_logged_in?
      if !@current_team.players.find_by(:number => params[:number]).nil?
        flash[:message] = "Unable to add player because the number #{params[:number]} is already taken. Choose a different number and try again."
        erb :"/player/new"
      elsif !params[:name].empty? && !params[:number].empty?
        @player = Player.create!(:name => params[:name], :number => params[:number])
        @current_team.players << @player
        @current_team.save
        redirect "player/#{@player.id}"
      else
         flash[:message] = "A new player must have both a name and a number"
        erb :"/player/new"
      end
    else
      redirect "/"
    end
  end

  get "/player/:id" do
    if is_logged_in?
      @player = @current_team.players.find(params[:id])
      erb :'player/show'
    else
      redirect "/"
    end
  end

  get "/player/:id/edit" do
    if is_logged_in?
      @player = @current_team.players.find(params[:id])
      erb :'player/edit'
    else
      redirect "/"
    end
  end

  get "/player/:id/delete" do
    if is_logged_in?
      @player = @current_team.players.find(params[:id])
      @player.delete
      redirect "/teams/#{@current_team.id}"
    else
      redirect "/"
    end
  end

  patch "/player/:id" do
    if is_logged_in?
      @player = @current_team.players.find(params[:id])
      if !@current_team.players.find_by(:number => params[:number]).nil? && @player.number != params[:number].to_i
        binding.pry
        flash[:message] = "Unable to edit player because the number #{params[:number]} is already taken. Choose a different number and try again."
        erb :"/player/edit"
      else
        @player.update(:name => params[:name]) if !params[:name].empty?
        @player.update(:number => params[:number]) if !params[:number].empty?
        @player.save
        redirect "/player/#{@player.id}"
      end
    else
      redirect "/"
    end
  end
end


