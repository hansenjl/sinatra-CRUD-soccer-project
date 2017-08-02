require './config/environment'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @team = Team.new(:name => params[name], :password => params[password])
    if @team.save && !params[name].empty?
      redirect "/teams/#{@team.id}"
    else
      redirect '/failure'
    end
  end

  get '/failure' do
    erb :failure
  end


  get '/login' do
    erb :login
  end

  post '/login' do
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get 'teams/:id' do
    @team = Team.find(params[:id])
    erb :'team/show'
  end

  helpers do
    def current_user
      Team.find(session[:user_id])
    end

    def is_logged_in?
      !!session[:user_id]
    end
  end
end