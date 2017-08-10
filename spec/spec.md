# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
      - Self explanatory
- [x] Use ActiveRecord for storing information in a database
      - All models and controllers use ActiveRecord

- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
      - There are 4 model classes: Player, Team, Position, Formation
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
    -Formation class has many teams, players, and positions

- [x] Include user accounts
      -Each team is a separate user account

- [X] Ensure that users can't modify content created by other users
      - Users must be logged-in to view or edit content and the content that they view is populated based on the current user.

- [X] Include user input validations
      - Users must include a team name and password when they sign up.
      - There are other validations that make sure the user doesn't create a player with a number that has already been used.

- [X] Display validation failures to user with error message (example form URL e.g. /posts/new)
      - Failure message will appear when there is a validation failure

- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message
