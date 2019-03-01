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
require_relative 'simulations'
# read the given argument next to ruby File.rb and evaluate it
sim = Simulations.new
case ARGV[0].to_s.downcase
when '-h', '--help', 'help', '/?'
  puts "Usage: ruby #{__FILE__} "
  puts '                  [-h,--help,help] [-c,--clean,clean]'
  puts '                  [-t,--test,test] [Any_Number] [-r,--record,record]'
  puts 'Options:'
  puts '-h, --help, help     =>shows help screen'
  puts '-c, --clean, clean   =>clean recorded results of simulation.'
  puts "-r, --record, record =>records #{Simulations::SIMULATIONS_COUNT} results of simulation."
  puts "-t, --test, test     =>tests against #{Simulations::SIMULATIONS_COUNT} recorded results."
  puts '<ANY_NUMBER>         =>shows result of simulation initialized with <ANY_NUMBER>.'
  puts '<EMPTY>              =>shows result of random simulation.'
when '-c', '--clean', 'clean'
  FixtureHandler.clear_fixtures
when '-r', '--record', 'record'
  sim.record_fixtures
when '-t', '--test', 'test'
  sim.test_output
when /\d(.\d+)?/
  sim.run_simulation ARGV[0].to_f
else
  sim.run_simulation
end
