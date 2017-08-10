# sinatra-CRUD-soccer-project
Sinatra CRUD Soccer Project is a Sinatra app that allows users to build a soccer team, create players, and assign them to positions in a formation.
---

### Logging In
On the main page, you must sign up or log in to access the other pages. Once you log in, you will see your team name and a list of options.

---
### New Player
In order to create a formation, you must first have 11 players. Start by adding new players to your team. You must enter both a name and a number for each player.

---
### Playing a Game
On a Game screen, the game board will be displayed, along with the game's status and links to the players' profile pages.
Players of the game will also have the option to forfeit the game or place a token if it's their turn.

In a game against the computer, the page will automatically refresh when the computer has made its move. In a game against another player, the page must be refreshed manually to see if the opponent has made their move.

---
### Profile Pages
Displayed on a user's profile page is a grid of board previews linking to their ongoing games, along with their game performance history (number of games won and lost against previous opponents, and an overal win&tie/loss ratio).

On a user's own profile page, they will also see a list of sent and received game invites, with the option to delete sent invites or ignore received invites (the sender will remain unaware).

---

## Installation
To use the application locally, clone the repo and run `bundle install` from the game directory. Then run `rake db:migrate` to load the databases. Then, run `shotgun` and navigate to `localhost:9393` in your browser.

---

## Contributing
Feel free to submit a pull request.

---

## License

This is created with a MIT license.