# sinatra-CRUD-soccer-project
Sinatra CRUD Soccer Project is a Sinatra app that allows users to build a soccer team, create players, and assign them to positions in a formation.
---

### Logging In
On the main page, you must sign up or log in to access the other pages. Once you log in, you will see your team name and a list of options.

---
### New Player
In order to create a formation, you must first have 11 players. Start by adding new players to your team. You must enter both a name and a number for each player. You can always edit or delete a player.

---
### Home
The home button will show you the team page. It lists all of the players currently on your team.

---
### New Formation
Once your team has 11 players, you can create a new formation.At present, each team can only have one formation but this could be expanded in later versions. Choose one player for each position and make sure you do not use a player more than once. You may edit a formation once you have created it. The only way to change a player's position is to change the formation.

---
## Installation
To use the application locally, clone the repo and run `bundle install` from the game directory. Then run `rake db:migrate` to load the databases. Then, run `shotgun` and navigate to `localhost:9393` in your browser.

---

## Contributing
Feel free to submit a pull request.

---

## License

This is created with a MIT license.