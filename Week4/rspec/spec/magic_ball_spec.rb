require 'magic_ball'
describe MagicBall do
  describe '.ask' do
    context 'ask returns an answer' do
      it 'returns an answer' do
        expect(MagicBall::ANSWERS).to include(MagicBall.ask('Is Minitest awesome?'))
      end
    end
  end
end

describe MagicBall do
  describe '.ask' do
    context 'answer is array' do
      it 'returns an array' do
        expect(MagicBall::ANSWERS).to be_an_instance_of(Array)
      end
    end
  end
end

describe MagicBall do
  describe '.ask' do
    context 'answer is not empty' do
      it 'returns if answer is not empty' do
        expect(MagicBall::ANSWERS).not_to eql('')
      end
    end
  end
end

describe MagicBall do
  describe '.ask' do
    context 'Raise error when question is number' do
      it 'returns if question has invalid format' do
        expect { MagicBall.ask(1) }.to raise_error(StandardError, 'Question has invalid format.')
      end
    end
  end
end
