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
  end

  describe '.initialize' do
    it 'evaluate if the is_getting_out_of_penalty_box return a boolean' do
      expect(correct.is_getting_out_of_penalty_box).to be(true).or be(false)
    #   expect(correct.is_getting_out_of_penalty_box).to be_bool
      # expect([true, false]).to include(correct.is_getting_out_of_penalty_box)
    end
  end
end
