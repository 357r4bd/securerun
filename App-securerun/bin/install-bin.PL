#!/usr/bin/env perl

use strict;
use warnings;
use Config;
use File::Copy;

my $file = $ARGV[0];

die q{File doesn't exist} if ! $file;
die q{File doesn't exist} if ! -e $file;

# copys bin/securerun to system bin directory and ensures its is 755
if (-w $Config{installbin}) {
    print qq{Installing $file in $Config{installbin}\n};
    copy($file, $Config{installbin}) or die $!;
    chmod 0755, $Config{installbin};
}
else {
    print qq{You do not have permission to write to $Config{installbin}\n};
    print qq{Warn: bin/securerun not installed to $Config{installbin}\n};
}

1;
