class PlayerController < ApplicationController

  get '/player/new' do
    redirect_if_not_logged_in
    erb :'player/new'
  end

  post '/player' do
    redirect_if_not_logged_in
    if !current_team.players.find_by(:number => params[:number]).nil?
      flash[:message] = "Unable to add player because the number #{params[:number]} is already taken. Choose a different number and try again."
      erb :"/player/new"
    elsif !params[:name].empty? && !params[:number].empty?
      @player = current_team.players.build(:name => params[:name], :number => params[:number])
      @player.save
      redirect "player/#{@player.id}"
    else
       flash[:message] = "A new player must have both a name and a number"
      erb :"/player/new"
    end
  end

  get "/player/:id" do
    redirect_if_not_logged_in
    if @player = current_team.players.find_by(id: params[:id])
      erb :'player/show'
    else
      redirect to "/teams/#{current_team.id}"
    end
  end

  get "/player/:id/edit" do
    redirect_if_not_logged_in
    if @player = current_team.players.find_by(params[:id])
      erb :'player/edit'
    else
      redirect to "/teams/#{current_team.id}"
    end
  end

  delete "/player/:id" do
    redirect_if_not_logged_in
    @player = current_team.players.find(params[:id])
    @player.delete
    redirect "/teams/#{current_team.id}"
  end

  patch "/player/:id" do
    redirect_if_not_logged_in
    @player = current_team.players.find(params[:id])
    if @player && !current_team.players.find_by(:number => params[:number]).nil? && @player.number != params[:number].to_i
      flash[:message] = "Unable to edit player because the number #{params[:number]} is already taken. Choose a different number and try again."
      erb :"/player/edit"
    else
      @player.update(:name => params[:name]) if !params[:name].empty?
      @player.update(:number => params[:number]) if !params[:number].empty?
      @player.save
      redirect "/player/#{@player.id}"
    end
  end
end


