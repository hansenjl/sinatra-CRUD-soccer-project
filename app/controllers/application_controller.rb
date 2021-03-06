require './config/environment'
require 'pry'
require 'sinatra/base'
require 'rack-flash'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"

    use Rack::Flash
  end

  get '/' do
    if is_logged_in?
      redirect "/teams/#{@current_team.id}"
    else
      erb :index
    end
  end

  get '/signup' do
    if is_logged_in?
      redirect "/teams/#{@current_team.id}"
    else
      erb :signup
    end
  end

  post '/signup' do
    if !Team.find_by(:name => params[:name]).nil?
      flash[:message] = "Oops! That team name is already taken. Please try again."
        erb :signup
    else
      @team = Team.new(:name => params[:name], :password => params[:password])
      if @team.save && !params[:name].empty?
        session[:user_id] = @team.id
        redirect "/teams/#{@team.id}"
      else
        flash[:message] = "Oops! It looks like your sign up attempt has failed. Please try again."
        erb :signup
      end
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
    redirect_if_not_logged_in
    @team = Team.find(params[:id])
    erb :'team/show'
  end

  get '/teams/:id/edit' do
    redirect_if_not_logged_in
    @team = Team.find(params[:id])
    erb :'team/edit'

  end

  patch '/teams/:id' do
    redirect_if_not_logged_in
    team = Team.find(params[:id])
    team.update(:name => params[:name])
    team.save
    redirect "/teams/#{team.id}"
  end


  helpers do
    def current_team
      @current_team ||= Team.find_by(:id => session[:user_id]) if session[:user_id]
    end

    def is_logged_in?
      !!current_team
    end

    def redirect_if_not_logged_in
      if !is_logged_in?
        redirect "/"
      end
    end
  end
end