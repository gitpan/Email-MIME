use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Email::MIME',
    'VERSION_FROM'	=> 'MIME.pm', # finds $VERSION
    'PREREQ_PM'		=> {
        Email::Simple => 1.5,
        Email::MIME::Encodings => 1.0,
        Email::MIME::ContentType => 1.0
    }, # e.g., Module::Name => 1.1
);
