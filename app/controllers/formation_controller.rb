require 'pry'
class FormationController < ApplicationController

  get '/formation/new' do
    redirect_if_not_logged_in
    if @current_team.players.count >= 11
      @formations = Formation.all
      erb :'formation/new'
    else
      redirect '/formation/error'
    end
  end

  get '/formation/error' do
    redirect_if_not_logged_in
    erb :'formation/error'
  end


  post '/formation' do
    redirect_if_not_logged_in
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
    redirect_if_not_logged_in
    @formation = Formation.find(params[:id])
    erb :'formation/show'
  end

  get "/formation/:id/create" do
    redirect_if_not_logged_in
    @formation = @current_team.formation
    @players = @current_team.players
    erb :'formation/create'
  end

  post "/formation/:id" do
    redirect_if_not_logged_in
    players = []
    @formation = @current_team.formation
    @formation.positions.each do |position|
      if !@current_team.players.find_by(:name => params["#{position.name}"]).nil?
        player = @current_team.players.find_by(:name => params["#{position.name}"])
        position.player = player
        player.position = position
        position.save
        player.save
        players << player
      end
    end
    if players.uniq.count < 11
      flash[:message] = "Your formation is not complete. Be sure to use each player only once."
    end
    redirect "/formation/#{@formation.id}"
  end

  get "/formation/:id/edit" do
    redirect_if_not_logged_in
    @formation = @current_team.formation
    @players = @current_team.players
    erb :'formation/edit'
  end

  patch "/formation/:id" do
    redirect_if_not_logged_in
    if valid_player_count?(params[:positions])
      current_team.update_team_formation(params[:positions])
      redirect "/formation/#{@formation.id}"
    else
      flash[:message] = "Your formation is not complete. Be sure to use each player only once."
      erb :'formation/edit'
    end
  end

  helpers do

    def valid_player_count?(new_positions)
      # iterate over hash and push names into new array
      # check for unique names in array
      # check if count of unique names in the array < 11
      if new_postitions().uniq.count < 11
      false
    else
      true
    end
    end
    def default_4_3_3(formation)

      formation.positions << Position.create(:name => "Left Forward",:formation_id => formation.id)
      formation.positions << Position.create(:name => "Center Forward",:formation_id => formation.id)
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

