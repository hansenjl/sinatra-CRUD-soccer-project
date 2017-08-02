class PlayerController < ApplicationController

  get '/player/new' do
    erb :'player/new'
  end

  get "/player/:id" do
    @player = Player.find(params[:id])
    erb :'player/show'
  end

  get "/player/:id/edit" do
    @player = Player.find(params[:id])
    erb :'player/edit'
  end

  patch "/player/:id" do
    @player = Player.find(params[:id])
    redirect "/player/#{@player.id}"
  end
end