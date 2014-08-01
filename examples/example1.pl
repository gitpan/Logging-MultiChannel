#!/usr/bin/perl
# Example 1:  The simplest use case:
use strict;
use warnings;
use Logging::MultiChannel qw(Log);

Logging::MultiChannel::startLogging('example1.log');

Log('INF','This is an info message'); # This will default to the last log openned

Logging::MultiChannel::stopLogging('example1.log');
exit;
