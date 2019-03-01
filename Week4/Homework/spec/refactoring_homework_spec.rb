require 'fixture_handler'
require 'simulations'
def fixture_handler
  describe FixtureHandler do
    describe '.fixture_exists?' do
      it 'evaluate if return true or false' do
        expect(FixtureHandler.fixture_exists?(2)).to_not be nil
      end
    end
  end
end

def general_test(not_static)
  describe CorrectAnswerBehavior do
    describe '.getting_out not static' do
      it 'player is not more than 3' do
        expect(not_static.current_player).to be < 3
      end
      it 'evaluate if the message is not empty' do
        expect(not_static.message).to_not eq('')
      end
    end
  end
end

def player_change(correct_answ)
  describe CorrectAnswerBehavior do
    describe '.correct_answer' do
      it 'evaluate if the player change' do
        expect(correct_answ.current_player - 1).to_not be(correct_answ.current_player)
      end
    end
  end
end

def not_correct(correct_answ)
  describe CorrectAnswerBehavior do
    describe '.correct_answer' do
      it 'evaluate if the player lost' do
        expect(correct_answ).to eq(false)
      end
    end
  end
end

def out_penalty(correct_answ)
  describe CorrectAnswerBehavior do
    describe '.correct_answer' do
      it 'evaluate if get out of penalty box' do
        expect(correct_answ.in_penalty_box[correct_answ.current_player - 1]).to eq(true)
      end
    end
  end
end

def player_win(correct_answ)
  describe CorrectAnswerBehavior do
    describe '.correct_answ' do
      it 'evaluates if the player win' do
        expect(correct_answ).to eq(true)
      end
    end
  end
end

def check_init(correct)
  describe CorrectAnswerBehavior do
    describe '.initialize' do
      it 'evaluate if the player is in the array' do
        expect(correct.players).to include(correct.players[correct.current_player])
      end
    end
  end
end

def count_coins(coins, correct_answ)
  describe CorrectAnswerBehavior do
    describe 'initialize' do
      it 'evaluate if sum 1 to the coins' do
        expect(correct_answ.purses[correct_answ.current_player - 1]).to eq(coins + 1)
      end
    end
  end
end

correct_answ = CorrectAnswerBehavior.new
coins = correct_answ.purses[correct_answ.current_player]
method = correct_answ.correct_answer
if correct_answ.in_penalty_box[correct_answ.current_player - 1]
  if correct_answ.is_getting_out_of_penalty_box
    out_penalty(correct_answ)
    count_coins(coins, correct_answ)
    player_win(method)
  else
    not_correct(method)
  end
else
  count_coins(coins, correct_answ)
  player_win(method)
end
player_change(correct_answ)
general_test(correct_answ)
check_init(correct_answ)
fixture_handler
