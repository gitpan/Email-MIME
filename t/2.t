# vim:ft=perl
use Email::MIME::Encodings;
use MIME::Types;
use Test::More 'no_plan';
use_ok("Email::MIME");

my $txt_ext = join '|', MIME::Types->new->type('text/plain')->extensions;

open IN, "t/mail-2" or die $!;
undef $/;
my $string = <IN>;
my $obj = Email::MIME->new($string);
isa_ok($obj, "Email::MIME");
is($obj->debug_structure,<<EOF);
+ multipart/related; boundary="----=_NextPart_000_0001_01C3D13C.8846CC50"
     + multipart/alternative; boundary="----=_NextPart_001_0002_01C3D13C.884B8740"
          + text/plain; charset="us-ascii"
          + text/html; charset="us-ascii"
     + application/octet-stream; name="image001.gif"
EOF

my @parts = ($obj->parts)[0]->parts;
my $filename = $parts[0]->filename(1);
like($filename, qr/attachment-\d+-0\.(?:$txt_ext)/, "Filename correct");
my $filename2 = $parts[1]->filename(1);
like($filename2, qr/attachment-\d+-1\.html/, "Filename correct");
is($filename,$parts[0]->filename(1), "Filename consistent");
