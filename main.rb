require './game'
require './random_player'
require './your_player'
require './helper'

srand(129)

grid_size = 100

your_strategy = lambda {
  game = Game.new(grid_size: grid_size)

  player1 = YourPlayer.new(game: game, name: 'Jhonny')
  player2 = YourPlayer.new(game: game, name: 'Alex')

  game.add_player(player1)
  game.add_player(player2)

  game.start
}

random_strategy = lambda {
  game = Game.new(grid_size: grid_size)

  random_player = RandomPlayer.new(game: game, name: 'Rando 1')
  random_player2 = RandomPlayer.new(game: game, name: 'Rando 2')

  game.add_player(random_player)
  game.add_player(random_player2)

  game.start
}

random_results = random_strategy.call
your_results = your_strategy.call

compare_hashes(your_results, random_results)
