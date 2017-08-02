class FormationController < ApplicationController

  get '/formation/new' do
    erb :'formation/new'
  end

  get "/formation/:id" do
    @formation = Formation.find(params[:id])
    erb :'formation/show'
  end

  get "/formation/:id/edit" do
    @formation = Formation.find(params[:id])
    erb :'formation/edit'
  end

  patch "/formation/:id" do
    @formation = Formation.find(params[:id])
    redirect "/formation/#{@formation.id}"
  end
end

