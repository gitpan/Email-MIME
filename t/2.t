# vim:ft=perl
use Email::MIME::Encodings;
use Test::More 'no_plan';
use_ok("Email::MIME");
open IN, "t/mail-2" or die $!;
undef $/;
my $string = <IN>;
my $obj = Email::MIME->new($string);
isa_ok($obj, "Email::MIME");
is( $obj->debug_structure, <<EOF , "structure checks out");
+ multipart/related; boundary="----=_NextPart_000_0001_01C3D13C.8846CC50"
     + multipart/alternative; boundary="----=_NextPart_001_0002_01C3D13C.884B8740"
          + text/plain; charset="us-ascii"
          + text/html; charset="us-ascii"
     + application/octet-stream; name="image001.gif"
EOF

is($obj->body, "This is a multi-part message in MIME format.\n\n", "body is correct");
like((($obj->parts)[0]->parts)[0]->body, qr/^Happy New Year/, "message is correct");
