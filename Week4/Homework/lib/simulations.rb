require 'test/unit/assertions'
require_relative 'fixture_handler'
require_relative 'correct_answer'
require_relative 'out_to_string_redirector'
# class for the simulations of the trivia
class Simulations
  include Test::Unit::Assertions
  SIMULATIONS_COUNT = 5000

  # method that run a simulation of the program
  def run_simulation(index = nil)
    answer = CorrectAnswerBehavior.new(index)
    answer.correct_answer
    puts answer.message
  end

  def capture_simulation_output(index)
    StdOutToStringRedirector.redirect_stdout_to_string do
      run_simulation(index)
    end
  end

  # method that creates 4999 files with combinations of the simulation
  def record_fixtures
    SIMULATIONS_COUNT.times do |index|
      raise 'You need to clean recorded simulation results first!' if FixtureHandler.fixture_exists?(index + 1)
    end
    FixtureHandler.create_fixture_dir
    SIMULATIONS_COUNT.times do |index|
      FixtureHandler.write_fixture(index + 1, capture_simulation_output(index))
    end
  rescue RuntimeError => e
    puts 'ERROR!!!'
    puts e.message
  end

  def test_output
    SIMULATIONS_COUNT.times do |index|
      raise 'You need to record simulation results first!' unless FixtureHandler.fixture_exists?(index + 1)
      assert_equal(FixtureHandler.read_fixture(index + 1), capture_simulation_output(index))
    end
    puts 'OK.'
  rescue RuntimeError => e
    puts 'ERROR!!!'
    puts e.message
  end
end
