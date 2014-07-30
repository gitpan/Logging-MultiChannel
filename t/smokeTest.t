#!/usr/bin/perl
use strict;
use Test::More tests => 7; 

# Test 1
BEGIN {
    use_ok('Logging::MultiChannel',qw(Log));
}

# Test 2 - Open a log
my $logname='smokeTest.log';
my $fh=Logging::MultiChannel::startLogging($logname);
isnt( $fh, '',"Got a filehandle" );

# Test 3 - Did the log get created?
if (-f $logname) { pass("Log File exists."); } else { fail("Log File does not exist."); }

# Test 4 - Did the log get the last message
Log('Info','This is a test.');
checkLogLines($logname,1);

# Test 5 - Send an error
Log('Err','This is a error.');
checkLogLines($logname,2);

# Test 6 - Open two more logs

# Test 7 - Map INF to smokeTest1.log, and ERR to smokeTest1.log & smokeTest2.log
my $logname1='smokeTest1.log';
my $logname2='smokeTest2.log';

Logging::MultiChannel::startLogging($logname1);
Logging::MultiChannel::startLogging($logname2);

Logging::MultiChannel::mapChannel('INF',$logname1); # Put INF messages in myLogFile1.log
Logging::MultiChannel::mapChannel('ERR',$logname1); # Put ERR messages in myLogFile1.log
Logging::MultiChannel::mapChannel('ERR',$logname2); # ALSO put ERR messages in myLogFile2.log

Log('INF','This is an info message for smokeTest1.log');
Log('ERR','This is an Error message for smokeTest1.log & smokeTest2.log');

checkLogLines($logname1,2);
checkLogLines($logname2,1);

# All Done
Logging::MultiChannel::closeLogs(); # This will close ALL log files that are open

exit 0;

# This will check the number of lines in a log
# using wc -l
sub checkLogLines {
    my $logname=shift;
    my $expected=shift;
    chomp(my $lineCount=`wc -l $logname`);
    ok( $lineCount =~ m/$expected $logname/, "Log should have $expected line - got: ($lineCount).");

}

