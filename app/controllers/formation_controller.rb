class FormationController < ApplicationController

  get '/formation/new' do
    if is_logged_in?
      @formations = Formation.all
      erb :'formation/new'
    else
      redirect '/'
    end
  end

  post '/formation' do
  end

  get "/formation/:id" do
    if is_logged_in?
      @formation = Formation.find(params[:id])
      erb :'formation/show'
    else
      redirect '/'
    end
  end

  get "/formation/:id/edit" do
    if is_logged_in?
      @formation = Formation.find(params[:id])
      erb :'formation/edit'
    else
      redirect '/'
    end
  end

  patch "/formation/:id" do
    if is_logged_in?
      @formation = Formation.find(params[:id])
      redirect "/formation/#{@formation.id}"
    else
      redirect '/'
    end
  end
end

