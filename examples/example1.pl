#!/usr/bin/perl
# Example 1:  The simplest use case:
use strict;
use warnings;
use Test::More qw(no_plan);
use Logging::MultiChannel qw(Log);
Logging::MultiChannel::startLogging('myLogFile.log');
Log('INF','This is an info message'); # This will default to the last log openned

Logging::MultiChannel::stopLogging('myLogFile.log');
exit;
