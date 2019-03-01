require 'fixture_handler'
require 'simulations'

describe FixtureHandler do
  describe '.fixture_exists?' do
    it 'evaluate if return true or false' do
      expect(FixtureHandler.fixture_exists?(2)).to_not be nil
    end
  end
end

describe CorrectAnswerBehavior do
  correct = CorrectAnswerBehavior.new
  describe '.initialize' do
    it 'evaluate if the player is in the array' do
      expect(correct.players).to include(correct.players[correct.current_player])
    end
    it 'evaluate if the is_getting_out_of_penalty_box return a boolean' do
      expect(correct.is_getting_out_of_penalty_box).to be(true).or be(false)
    end
  end
end
describe CorrectAnswerBehavior do
  correct_static = CorrectAnswerBehavior.new(7)
  player = correct_static.current_player
  coins = correct_static.purses[correct_static.current_player]
  correct_static.correct_answer
  describe '.getting_out' do
    it 'evaluate if sum 1 to the coins' do
      expect(correct_static.purses[correct_static.current_player]).to eq(coins + 1)
    end
    it 'evaluate if get out of penalty box' do
      expect(correct_static.in_penalty_box[correct_static.current_player]).to eq(false)
    end
    it 'evaluate if the player change' do
      expect(correct_static.current_player).to eq(player + 1)
    end
  end
end
describe CorrectAnswerBehavior do
  not_static = CorrectAnswerBehavior.new
  exec_method = not_static.correct_answer
  describe '.getting_out not static' do
    it 'evaluates if the player win' do
      expect(exec_method).to eq(true)
    end
    it 'player is not more than 3' do
      expect(not_static.current_player).to be < 3
    end
    it 'evaluate if the message is not empty' do
      expect(not_static.message).to_not eq('')
    end
  end
end
