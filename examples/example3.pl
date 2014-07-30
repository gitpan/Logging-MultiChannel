#!/usr/bin/perl
# Example 3: Two channels to two log files, with one channel duplicated in both
use strict;
use warnings;
use Test::More qw(no_plan);
use Logging::MultiChannel qw(Log);
Logging::MultiChannel::startLogging('myLogFile1.log');
Logging::MultiChannel::startLogging('myLogFile2.log');

Logging::MultiChannel::mapChannel('INF','myLogFile1.log'); # Put INF messages in myLogFile1.log
Logging::MultiChannel::mapChannel('ERR','myLogFile1.log'); # Put ERR messages in myLogFile1.log
Logging::MultiChannel::mapChannel('ERR','myLogFile2.log'); # ALSO put ERR messages in myLogFile2.log

Log('INF','This is an info message for myLogFile1.log');
Log('ERR','This is an Error message for myLogFile1.log & myLogFile2.log');

Logging::MultiChannel::closeLogs(); # This will close ALL log files that are open
exit;
