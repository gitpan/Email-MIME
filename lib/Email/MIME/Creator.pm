use 5.008001;
use strict;
use warnings;
package Email::MIME::Creator;
{
  $Email::MIME::Creator::VERSION = '1.923';
}
# ABSTRACT: obsolete do-nothing library

use parent q[Email::Simple::Creator];
use Email::MIME;
use Encode ();

sub _construct_part {
  my ($class, $body) = @_;

  my $is_binary = $body =~ /[\x00\x80-\xFF]/;

  my $content_type = $is_binary ? 'application/x-binary' : 'text/plain';

  Email::MIME->create(
    attributes => {
      content_type => $content_type,
      encoding     => ($is_binary ? 'base64' : ''),  # be safe
    },
    body => $body,
  );
}

1;

__END__

=pod

=head1 NAME

Email::MIME::Creator - obsolete do-nothing library

=head1 VERSION

version 1.923

=head1 SYNOPSIS

You don't need to use this module for anything.

=head1 AUTHORS

=over 4

=item *

Ricardo SIGNES <rjbs@cpan.org>

=item *

Casey West <casey@geeknest.com>

=item *

Simon Cozens <simon@cpan.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2004 by Simon Cozens and Casey West.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
