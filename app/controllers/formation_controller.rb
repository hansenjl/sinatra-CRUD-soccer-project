require 'pry'
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
    case params[:formation]
    when "4-4-2"
      @formation = Formation.new
      default_4_4_2(@formation.id)
    when "4-3-3"
      @formation = Formation.new
      default_4_3_3(@formation.id)
    else
      redirect '/formation/new'
    end
    @formation.teams << current_team
    @formation.save
    binding.pry
    redirect "/formation/#{@formation.id}/edit"

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

  helpers do
    def default_4_4_2(formation_id)
      Position.create(:name => "left forward",:formation_id => formation_id)
      Position.create(:name => "right forward",:formation_id => formation_id)
      Position.create(:name => "center mid 1",:formation_id => formation_id)
      Position.create(:name => "left mid",:formation_id => formation_id)
      Position.create(:name => "center mid 2",:formation_id => formation_id)
      Position.create(:name => "right mid",:formation_id => formation_id)
      Position.create(:name => "left defender",:formation_id => formation_id)
      Position.create(:name => "stopper",:formation_id => formation_id)
      Position.create(:name => "right defender",:formation_id => formation_id)
      Position.create(:name => "sweeper",:formation_id => formation_id)
      Position.create(:name => "goalie",:formation_id => formation_id)
    end

    def default_4_3_3(formation_id)

      Position.create(:name => "left forward",:formation_id => formation_id)
      Position.create(:name => "center forward",:formation_id => formation_id)
      Position.create(:name => "right forward",:formation_id => formation_id)
      Position.create(:name => "left mid",:formation_id => formation_id)
      Position.create(:name => "center mid",:formation_id => formation_id)
      Position.create(:name => "right mid",:formation_id => formation_id)
      Position.create(:name => "left defender",:formation_id => formation_id)
      Position.create(:name => "stopper",:formation_id => formation_id)
      Position.create(:name => "right defender",:formation_id => formation_id)
      Position.create(:name => "sweeper",:formation_id => formation_id)
      Position.create(:name => "goalie",:formation_id => formation_id)
    end
  end
end

