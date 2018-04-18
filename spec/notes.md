https://gist.github.com/them0nk/2166525
https://github.com/teamcapybara/capybara

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



