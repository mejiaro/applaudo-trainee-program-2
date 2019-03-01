## Week 4 Evaluation

I divided the parts in different files, for the simulations I created a class `Simulations` where are all the files related to simulations, then is the `fixture_handler` file that is the responsible for all the things related with files, like create the files, the creation of the folder fixtures, the is the `correct_answer` file, this evaluate if the answer is correct or not, this determines whether he wins or loses, the is the `refactoring_homework` this is were all the previous files mention are being called, first evaluates if the argument given next to the `ruby refactoring_homework.rb`

**How to use it**

```
Usage: ruby refactoring_homework.rb
                  [-h,--help,help,/?] [-c,--clean,clean]
                  [-t,--test,test] [Any_Number] [-r,--record,record]
Options:'
-h, --help, help     =>shows help screen
-c, --clean, clean   =>clean recorded results of simulation.
-r, --record, record =>records 5000 results of simulation.
-t, --test, test     =>tests against 5000 recorded results.
<ANY_NUMBER>       =>shows result of simulation initialized with <ANY_NUMBER>
<EMPTY>              =>shows result of random simulation.
```

1. If the person types `ruby refactoring_homework.rb ` followed by a space with one of the following arguments (/?,--help,-h,help) then the program will display a help like the one above.
2. If the person types `ruby refactoring_homework.rb ` followed by a by allow space with one of the following arguments (-c,--clean,clean) the program will erase all the files that previously were created
3. If the person types `ruby refactoring_homework.rb ` followed by a space with one of the following arguments (-r,--record,record) the program will write 5000 files with different simulations of the trivia
4. If the person types `ruby refactoring_homework.rb ` followed by a space with one of the following arguments (-t,--test,test) the program will test the 5000 files against the 5000 simulations
5. If the person types `ruby refactoring_homework.rb ` followed by a space with any number then the simulation will run with that number
6. If the person just types `ruby refactoring_homework.rb ` with no arguments then the program will run a random simulation
