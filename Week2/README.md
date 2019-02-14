## Week 2 Evaluation


First shows the header like this
```
------------------------------------
|              Dates               |
------------------------------------
```
then proceed to ask the person for the name of the file where all the dates are,
after that  ask the person for the of the file that will contain the valid dates
and the name of the file for the invalid dates, then check, if the names are the same
proceed to ask them again

**Reader Method**

This reads the file and validates if is a valid date or not, the date use the format '%d/%m/%Y %H:%M:%S' but I added the `CST` to especify the time zone where El Salvador is, and then proceed to get the time of `EST` with `getlocal('-05:00')`, -05:00 is for the EST zone, if this process is successful  then added the date to an array of god dates if not then added the date, the event and the line number to an array of bad dates, later proceeds to print a description of the lines where are invalid dates.

 **goodFileCreation Method**
 
 This method gets the array of the valid dates and the name of the output file,
 is responsible for ordering the array by date and to write the file and a graphic
 like this were the percentages are written vertically:

```
GRAPHIC:

╔════════════════════════════════════════════════════════════╗
║
║  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 78% valid dates
║  
║  ■■■■■■■■■■■ 22% invalid dates
║  
║  ----------------------------------------------------%
║  0 4 8 1 1 2 2 2 3 3 4 4 4 5 5 6 6 6 7 7 8 8 8 9 9 1
║        2 6 0 4 8 2 6 0 4 8 2 6 0 4 8 2 6 0 4 8 2 6 0
║                                                    0
╚════════════════════════════════════════════════════════════╝
```
 **wrongFileCreation Method**
 This method gets the array of the invalid dates and the name of the output file,
 is responsible for write the file with the values of the array (event,Date,Line number)

 The methods `goodFileCreation` and `wrongFileCreation` are call using a proc call *safe* that rescue the possible exceptions that may happen

 **graph Method**
 This method gets the number of valid dates and the number of invalid dates and then print a graphic like the one in the file of the valid dates
