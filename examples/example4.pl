#!/usr/bin/perl
# Example 4: Using a provided filehandle. Note
# if you do this, the log cycle functions are 
# disabled.
use strict;
use warnings;
use Logging::MultiChannel qw(Log);
my $filename='example4.log';
open (my $fh,">$filename") or die("Unable to open $filename");

Logging::MultiChannel::startLoggingOnHandle('My very own filehandle',$fh);

Log('INF','This is an info message for myLogFile1.log');

Logging::MultiChannel::closeLogs(); # This will close ALL log files that are open
exit;
