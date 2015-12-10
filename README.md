# clueLess-server


## Quickstart

1. Install [ruby](https://www.ruby-lang.org/en/documentation/installation/). On Windows dowload [JRuby](http://jruby.org/) instead with [Java runtime](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html).
2. Install [Github GUI](https://desktop.github.com/)
    - Login with user/password
    - Once logged in, click the plus icon in top left corner. 
    - Next select the en-604-pioNeers -> clueLess-server item.
    - Once select, select an area to copy the project on your system.
3. Open a command line window and navigate to the project folder.
4. run `ruby -v` or `jruby -v` (on windows) from console. Verify the ruby version is installed.
5. run

    ```bash
    gem install bundler
    bundle install
    rake db:setup
    rake db:seed
    ```

6. finally start the server by running `rails s`
7. Navigate in your browser to `http://localhost:3000`

From here forward you only need to run `rails s` unless a change to the database is made. In that case you may need to reset your environment.


## REST APIs that require a payload.

Take a look at the config/routes file for REST API.

```

# Add a player to the game
POST /players
must pass through json with the following:
{
  "name": "<name>",
  "board_piece": "<board piece>"
}

# Move a player to a location
POST /players/:player_id/move
must pass through json with the following:
{
  "location": "<location_id>"
}
(note for above: independent of room / hall. use IDs specified in game board)

# The player makes a accusation
POST /players/:player_id/accuse
must pass through json with the following:
{
  "location": "<location_id>"
}

# The player makes a suggestion
POST /players/:player_id/suggest
must pass through json with the following:
{
  "location": "<location_id>"
}

```