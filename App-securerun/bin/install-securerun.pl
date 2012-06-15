#!/usr/bin/env perl

use strict;
use warnings;
use Config;
use File::Copy;

# copys bin/securerun to system bin directory and ensures its is 755

if (-w $Config{installbin}) {
    print "Installing securerun utility in $Config{installbin}\n";
    copy('bin/securerun', "$Config{installbin}/securerun") || die $!;
    chmod 0755, "$Config{installbin}/securerun";
}
else {
    print "You do not have permission to write to $Config{installbin}\n";
    print "Warn: bin/securerun not installed to $Config{installbin}\n";
}

1;
