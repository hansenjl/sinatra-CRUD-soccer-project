#Cheatsheet:
https://gist.github.com/them0nk/2166525
#Documentation:
https://github.com/teamcapybara/capybara


Examples:
https://github.com/hansenjl/sinatra-fwitter-group-project-v-000/blob/master/spec/controllers/application_controller_spec.rb

https://github.com/hansenjl/basic-sinatra-forms-lab-v-000/blob/master/spec/basic_sinatra_forms_spec.rb

When a user visits '/'
  they should see "Welcome"
  they should see a link to sign up
  they should see a link to log in

When a user visits '/signup'
  they should see a form with a name field
  they should fill in the name field with "Team123"
  they should fill in the password field with "password"
  they should click Sign Up!
  they should see the team name



