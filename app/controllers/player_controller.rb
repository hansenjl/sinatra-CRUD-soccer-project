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
      @player = Player.create!(:name => params[:name], :number => params[:number])
      @current_team.players << @player
      @current_team.save
      redirect "player/#{@player.id}"
    else
      redirect "/"
    end
  end

  get "/player/:id" do
    if is_logged_in?
      @player = Player.find(params[:id])
      erb :'player/show'
    else
      redirect "/"
    end
  end

  get "/player/:id/edit" do
    if is_logged_in?
      @player = Player.find(params[:id])
      erb :'player/edit'
    else
      redirect "/"
    end
  end

  get "/player/:id/delete" do
    if is_logged_in?
      @player = Player.find(params[:id])
      @player.delete
      redirect "/teams/#{@current_team.id}"
    else
      redirect "/"
    end
  end

  patch "/player/:id" do
    if is_logged_in?
      @player = Player.find(params[:id])
      @player.update(:name => params[:name], :number => params[:number])
      @player.save
      redirect "/player/#{@player.id}"
    else
      redirect "/"
    end
  end
end