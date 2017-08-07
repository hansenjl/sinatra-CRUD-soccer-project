require './config/environment'
require 'pry'
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
    if is_logged_in?
      redirect "/teams/#{@current_team.id}"
    else
      erb :signup
    end
  end

  post '/signup' do
    @team = Team.new(:name => params[:name], :password => params[:password])
    if @team.save && !params[:name].empty?
      session[:user_id] = @team.id
      redirect "/teams/#{@team.id}"
    else
      redirect '/failure'
    end
  end

  get '/failure' do
    erb :failure
  end


  get '/login' do
    if is_logged_in?
      redirect "/teams/#{@current_team.id}"
    else
      erb :login
    end
  end

  post '/login' do
    @team = Team.find_by(name: params[:name])

    if @team && @team.authenticate(params[:password])
      session[:user_id] = @team.id
      redirect "/teams/#{@team.id}"
    else
      redirect '/failure'
    end

  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/teams/:id' do
    if is_logged_in?
      @team = Team.find(params[:id])
      erb :'team/show'
    else
      redirect '/'
    end
  end


  helpers do
    def current_team
      @current_team ||= Team.find(session[:user_id])
    end

    def is_logged_in?
      !!current_team
    end
  end
end