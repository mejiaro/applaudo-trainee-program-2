class MagicBall
  ANSWERS = [
    'It is certain',
    'It is decidedly so',
    'Without a doubt',
    'Yes, definitely',
    'You may rely on it',
    'As I see it, yes',
    'Most likely',
    'Outlook good',
    'Yes',
    'Signs point to yes',
    'Reply hazy try again',
    'Ask again later',
    'Better not tell you now',
    'Cannot predict now',
    'Concentrate and ask again',
    "Don't count on it",
    'My reply is no',
    'My sources say no',
    'Outlook not so good',
    'Very doubtful'
  ].freeze

  def self.ask(question)
    raise 'Question has invalid format.' unless question.is_a?(String) && question[-1] == '?'

    ANSWERS.sample
  end

  private

  def is_question_valid?(question)
    question.is_a?(String) && question[-1] == '?'
  end
end
