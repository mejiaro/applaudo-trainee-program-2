# fds
class CorrectAnswerBehavior
  attr_accessor :players, :purses, :in_penalty_box, :current_player, :is_getting_out_of_penalty_box
  def initialize(seed = nil)
    srand(seed) if seed
    @players = %w[Alice Bob Cecil]
    @purses = @players.map { rand(2..4) }
    @in_penalty_box = @players.map { rand(2).zero? }
    @current_player = rand(@players.count)
    @is_getting_out_of_penalty_box = @in_penalty_box[@current_player] && rand(2).zero?
  end

  def getting_out
    if @is_getting_out_of_penalty_box
      puts "#{@players[@current_player]} got out of penalty box\nAnswer was correct!!!!"
      @purses[@current_player] += 1
      puts "#{@players[@current_player]} now has #{@purses[@current_player]} Gold Coins."
      move_player
      winner = did_player_win
      winner
    else
      puts "#{@players[@current_player]} stays in penalty box"
      move_player
      true
    end
  end

  def correct_answer
    if @in_penalty_box[@current_player]
      getting_out
    else
      puts 'Answer was correct!!!!'
      @purses[@current_player] += 1
      puts "#{@players[@current_player]} now has #{@purses[@current_player]} Gold Coins."
      move_player
      winner = did_player_win
      winner
    end
  end

  private

  def did_player_win
    @purses[@current_player] != 6
  end

  def move_player
    @current_player += 1
    @current_player = 0 if @current_player == @players.length
    puts "Player is now #{@players[@current_player]}"
  end
end
