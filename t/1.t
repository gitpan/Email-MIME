# vim:ft=perl
use Email::MIME::Encodings;
use Test::More 'no_plan';
use_ok("Email::MIME");
open IN, "t/mail-1" or die $!;
undef $/;
my $string = <IN>;
my $obj = Email::MIME->new($string);
isa_ok($obj, "Email::MIME");
my ($part) = $obj->parts;
isa_ok($part, "Email::MIME");
my $body = $part->body;

is($body, Email::MIME::Encodings::decode(base64 => $obj->body_raw),
    "Internally consistent");
open(GIF, "t/att-1.gif") or die $!;
my $gif = <GIF>;
is($body, $gif, "Externally consistent");
