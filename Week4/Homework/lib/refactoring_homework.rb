# What to do?
#
# 1. Look at the code of the class CorrectAnswerBehavior
# 2. Try to see what it does by running `ruby refactoring_example.rb`
# 3. Record characterisation tests by running `ruby refactoring_example.rb --record`
# 4. Make the code beautiful;)
# 5. You are allowed to modify only the code between markers (REFACTORING START/REFACTORING END).
# 6. Test must pass! You can run them with command `ruby refactoring_example.rb --test`
# 7. For suggestions of other exercises based on this code...
#     a) Follow http://twitter.com/programmingwod or
#     b) like https://www.facebook.com/ProgrammingWorkout or
#     c) signup to http://programmingworkout.com
#
# Usage:
#  ruby refactoring_example.rb [-h|--help|help]       - shows help screen.
#  ruby refactoring_example.rb [-c|--clean|clean]     - clean recorded results of simulation.
#  ruby refactoring_example.rb [-r|--record|record]   - records 5000 results of simulation.
#  ruby refactoring_example.rb [-t|--test|test]       - tests against 5000 recorded results of simulation.
#  ruby refactoring_example.rb <ANY_NUMBER>           - shows result of simulation initialized with <ANY_NUMBER>.
#  ruby refactoring_example.rb                        - shows result of random simulation.
#
# License: MIT (see at the end of the file)
# This code is based on Trivia Game example used in Legacy Code Retreats
# You can find it at https://github.com/jbrains/trivia

# ------------------------------ REFACTORING START ------------------------------
require_relative 'out_to_string_redirector'
# fds
class CorrectAnswerBehavior
  def getting_out
    if @is_getting_out_of_penalty_box
      puts "#{@players[@current_player]} got out of penalty box \n Answer was correct!!!!"
      @purses[@current_player] += 1
      puts "#{@players[@current_player]} now has #{@purses[@current_player]} Gold Coins."
      winner = did_player_win
      winner
    else
      puts "#{@players[@current_player]} stays in penalty box"
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
      winner = did_player_win
      winner
    end
    @current_player += 1
    @current_player = 0 if @current_player == @players.length
    puts "Player is now #{@players[@current_player]}"
  end

  private

  def did_player_win
    @purses[@current_player] != 6
  end

  # ------------------------------ REFACTORING END ------------------------------

  public

  def initialize(seed = nil)
    srand(seed) if seed
    @players = %w[Alice Bob Cecil]
    @purses = @players.map { rand(2..4) }
    @in_penalty_box = @players.map { rand(2).zero? }
    @current_player = rand(@players.count)
    @is_getting_out_of_penalty_box = @in_penalty_box[@current_player] && rand(2).zero?
  end
end

require 'fileutils'
# This module handle all the things related with paths
module FixtureHandler
  def self.clear_fixtures
    FileUtils.rm_rf(fixtures_dir)
  end

  def self.create_fixture_dir
    FileUtils.mkdir(fixtures_dir)
  end

  # create a file that the given index is the title and the
  def self.write_fixture(index, text)
    File.open(fixture_path(index), 'w') do |file|
      file.write(text)
    end
  end

  # evaluate if the file with the given index exists
  def self.fixture_exists?(index)
    File.exist?(fixture_path(index))
  end

  # read the file that his title is the same of the given number
  def self.read_fixture(index)
    File.read(fixture_path(index))
  end

  # Get the path of the file with the given number or index
  def self.fixture_path(index)
    "#{fixtures_dir}/#{index}.txt"
  end

  # Load the path of the project add the name of the folder that is goin
  # to be create in the method create_fixture_dir
  def self.fixtures_dir
    "#{__dir__}/fixtures"
  end
end

# method to read the given argument next to ruby File.rb
case ARGV[0].to_s.downcase
when '-h', '--help', 'help'
  puts 'Usage:'
  puts "  ruby #{__FILE__} [-h|--help|help]       - shows help screen."
  puts "  ruby #{__FILE__} [-c|--clean|clean]     - clean recorded results of simulation."
  puts "  ruby #{__FILE__} [-r|--record|record]   - records #{SIMULATIONS_COUNT} results of simulation."
  puts "  ruby #{__FILE__} [-t|--test|test]       - tests against #{SIMULATIONS_COUNT} recorded results of simulation."
  puts "  ruby #{__FILE__} <ANY_NUMBER>           - shows result of simulation initialized with <ANY_NUMBER>."
  puts "  ruby #{__FILE__}                        - shows result of random simulation."
when '-c', '--clean', 'clean'
  clean_fixtures
when '-r', '--record', 'record'
  record_fixtures
when '-t', '--test', 'test'
  test_output
when /\d(.\d+)?/
  run_simulation ARGV[0].to_f
else
  run_simulation nil
end
