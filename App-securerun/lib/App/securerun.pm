package App::securerun;

use 5.014002;
use strict;
use warnings;

require Exporter;
use AutoLoader qw(AUTOLOAD);

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use App::securerun ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.01';


# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
=head1 NAME

App::securerun - Perl application for scriting scripts to interact with remote computers. 

=head1 SYNOPSIS

  use App::securerun;

=head1 DESCRIPTION

=head1 COMMANDS

=over 4

=item -c

clears the terminal screen when securerun is executed

=item -f

specify the runfile

=item -h c<HOSTFILE>

specifies the .srhosts.def file that describes the environment
of the machine you are working from.  If not specified, it searches
all the directories listed in your PATH enviromental variable.  It
is best to place this in your home directory and make sure that "~"
is in your path.

=item -i

interactive mode - asks for user to hit a key whenever a start tag is encountered,
useful for debugging

=item -l

allows user to select any host in the c<HOSTFILE> as their local host;
the default is "localhost", and it is specified using the value of the "name"
attribute in the "host" definition.

=item -o

specify arguments to pass through to the configuration file for
preprocessing; e.g., -o ARG1=123 -o ARG2=abc will result in $ARG1 and
$ARG2 in the configuration being replaced with 123 and abc
respectively prior to the actual running of the config file

=item -v 

verbose mode

=item -checkmacro [none|warn|halt]

sets the level and response of unresolved
macros (ex, %VARNAME%); options are none, warn, and halt;
default is none.  !THIS OPTION IS NOT FULLY IMPLEMENTED!

=item -saverunfile

if set, a copy of the actual run file is dumped into the base directory

=item -dontprocessrunfile

securerun wil not process the run file; the run file is processed for macros
by default

=item -noenv

doesn't read in environment into %extraOps hash used in macro
processing

=item -noinput

disables <input> tag used for interactivity - could break scripts
that depend on user input, but could be useful if run in batch
defining vars through "-o"

=item -nosplash

do not display securerun splash message

=item -showcomments

displays comments during processing - useful for status messages

=item -showtext

displays all text detected by HTML::Parser

=item -version

lists the version number and exits

=back

=head1 SEE ALSO

=head1 AUTHOR

B. Estrade, E<lt>estrabd@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by estrabd

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
