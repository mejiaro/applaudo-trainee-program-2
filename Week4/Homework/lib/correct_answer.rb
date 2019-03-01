# method that describe the actions of the trivia, it evaluate if the answer is correct or no
class CorrectAnswerBehavior
  attr_accessor :players, :purses, :in_penalty_box, :current_player, :is_getting_out_of_penalty_box, :message
  def initialize(seed = nil)
    srand(seed) if seed
    @players = %w[Alice Bob Cecil]
    @purses = @players.map { rand(2..4) }
    @in_penalty_box = @players.map { rand(2).zero? }
    @current_player = rand(@players.count)
    @is_getting_out_of_penalty_box = @in_penalty_box[@current_player] && rand(2).zero?
    @mesage = []
  end

  # method that describe if the player stays or leave the penalty box
  def getting_out
    @message = []
    if @is_getting_out_of_penalty_box
      @message << " #{@players[@current_player]} got out of penalty box\nAnswer was correct!!!!\n"
      @purses[@current_player] += 1
      @message << " #{@players[@current_player]} now has #{@purses[@current_player]} Gold Coins.\n"
      move_player
      winner = did_player_win
      winner
    else
      @message << " #{@players[@current_player]} stays in penalty box\n"
      move_player
      false
    end
  end

  # method that evaluate if the answer is correct
  def correct_answer
    @message = []
    if @in_penalty_box[@current_player]
      getting_out
    else
      @message << " Answer was correct!!!!\n"
      @purses[@current_player] += 1
      @message << " #{@players[@current_player]} now has #{@purses[@current_player]} Gold Coins.\n"
      move_player
      winner = did_player_win
      winner
    end
  end

  private

  def did_player_win
    @purses[@current_player] != 6
  end

  # method that icrease the current player and print who is the new player
  def move_player
    @current_player += 1
    @current_player = 0 if @current_player == @players.length
    @message << " Player is now #{@players[@current_player]}\n"
  end
end
