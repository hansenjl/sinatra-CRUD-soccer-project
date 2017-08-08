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
      @formation = Formation.new(:name => "4-4-2")
      default_4_4_2(@formation)
    when "4-3-3"
      @formation = Formation.new(:name => "4-3-3")
      default_4_3_3(@formation)
    else
      redirect '/formation/new'
    end
    @formation.teams << @current_team
    @formation.save
    redirect "/formation/#{@formation.id}/create"
  end

  get "/formation/:id" do
    if is_logged_in?
      @formation = Formation.find(params[:id])
      erb :'formation/show'
    else
      redirect '/'
    end
  end

  get "/formation/:id/create" do
    if is_logged_in?
      @formation = Formation.find(params[:id])
      @players = @current_team.players
      erb :'formation/create'
    else
      redirect '/'
    end
  end

  post "/formation/:id" do
    if is_logged_in?
      @formation = Formation.find(params[:id])
      @formation.positions.each do |position|
        position.player = Player.find_by(:name => params["#{position.name}"])
        position.save
      end
      redirect "/formation/#{@formation.id}"
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
    def default_4_4_2(formation)
      formation.positions << Position.create(:name => "Left Forward",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Right Forward",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Center Mid 1",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Left Mid",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Center Mid 2",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Right Mid",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Left Defender",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Stopper",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Right Defender",:formation_id => formation.id)
     formation.positions <<  Position.create(:name => "Sweeper",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Goalie",:formation_id => formation.id)
    end

    def default_4_3_3(formation)

      formation.positions << Position.create(:name => "Left Forward",:formation_id => formation.id)
      formation.positions << Position.create(:name => "center Forward",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Right Forward",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Left Mid",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Center Mid",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Right Mid",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Left Defender",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Stopper",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Right Defender",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Sweeper",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Goalie",:formation_id => formation.id)
    end
  end
end

