use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
if ($]< 5.00703) {
    print "Email::MIME requires either Encode or MIME::Words to decode
MIME headers. You've not got Perl 5.7.3, so for you, we depend on 
MIME::Words.\n\n";
}
WriteMakefile(
    'NAME'		=> 'Email::MIME',
    'VERSION_FROM'	=> 'MIME.pm', # finds $VERSION
    'PREREQ_PM'		=> {
        Email::Simple => 1.7,
        Email::MIME::Encodings => 1.0,
        Email::MIME::ContentType => 1.0,
        Test::More => 0,  # Testing
        ($] < 5.00703 ? (MIME::Words => 0 ) : (Encode => 0)),
        MIME::Types => 0, # Sad, really.
    }, # e.g., Module::Name => 1.1
);
