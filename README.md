# every-other-day-week
Bash scripts for running routines strictly every other day and strictly every other week.

# Overview
I was tasked with writing two cron automations to do some stuff. The requirement was for one of the tasks to be run every other day and the other to be run every other week. Cron provides a way to do something like this with step values (the `/` symbol), but these are not safe around month and year boundaries.

For example, a crontab of 0 0 */2 * will run on every second day of the month at 12:00 AM. But for months with 31 days, this will result in two days between the run on day 30 and the next run on day two of the next month. We can do better, but not in a standard way in a crontab directly.

There is a similar problem for running a task every other week. You could simply look at the current week number within the year for a given date and make a determination based on whether the week number is even or odd, but not all years have 52 weeks. Some years have 53 weeks. All weeks have seven days. The beginning of the UNIX epoch started on a Thursday, so even time zero does not cleanly align with a week number.

The set of scripts in this repository simply make a deterministic and unambiguous decision about whether, for a given date, the day since the Epoch is an "even" day or an "odd" day, and whether for a given date, the week since the beginning of the Epoch is an "even" week or an "odd" week.

The week starts on Sunday. The week starting for the beginning of the Epoch is week zero. That is, Thursday, January 1st, 1970 is in the week of Sunday, December 28, 1969, which is week zero and is an even week. Thursday, January 1st, 1970 is day zero and is an even day. All other days and weeks around 1970-01-01 are thus unambiguously even or odd, for as many dates as the Linux date utility supports. This also works for days before the Epoch, if you need that for some reason.
