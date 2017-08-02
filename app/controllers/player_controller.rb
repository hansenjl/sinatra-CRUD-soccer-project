class PlayerController < ApplicationController

  get '/player/new' do
    if is_logged_in?
      erb :'player/new'
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

  patch "/player/:id" do
    if is_logged_in?
      @player = Player.find(params[:id])
      redirect "/player/#{@player.id}"
    else
      redirect "/"
    end
  end
end