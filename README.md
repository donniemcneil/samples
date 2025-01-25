# samples
pullCounts.sh: This script reads in a text file (host_list.txt), loops through assigning a host name to a variable ($BOX), performs an ssh to the box, retrieves a text file, does a word count list.

The use case for this is to retrieve log files from various locations, count the number of lines per log and do some quick addition.  Each single line log entry corresponded to an event.  We wanted to get the number of events captured in the logs.  Scripting it saved us from a lot of manual effort.
