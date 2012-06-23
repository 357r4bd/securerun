package App::securerun::srxml;

use strict;
use warnings;

our $VERSION = '1.0';

1;

#-- below is the source for: 
#
#	man 5 srxml 
#
__END__
=head1 NAME

Securerun XML Tags

=head1 SYNOPSIS

Securerun XML Tags are used basically to script the actions C<securerun> will perform.

=head1 DESCRIPTION

=head1 TAGS 

=over 4

=item <securerun> </securerun> 

=back

=head1 MACRO EXPANSION

=head1 INTERPRETER DETAILS

=head1 LOCAL HOST EXAMPLES

=head1 REMOTE HOST EXAMPLES

The XML format works directly with the I<srhost>(5) file when specifying remote systems with which 
it will interact. 

  <securerun>
    <script ...>
      [CDATA![
          echo hello
      ]] 
    </script>
  </securerun>

=head1 SEE ALSO

I<srxml>(5) I<securerun>(1)

=head1 AUTHOR

B. Estrade, E<lt>estrabd@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by estrabd

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
