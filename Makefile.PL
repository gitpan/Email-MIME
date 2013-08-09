
use strict;
use warnings;

use 5.008001;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "easy MIME message handling",
  "AUTHOR" => "Ricardo SIGNES <rjbs\@cpan.org>, Casey West <casey\@geeknest.com>, Simon Cozens <simon\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Email-MIME",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Email::MIME",
  "PREREQ_PM" => {
    "Carp" => "0",
    "Email::Address" => "0",
    "Email::MIME::ContentType" => "1.011",
    "Email::MIME::Encodings" => "1.314",
    "Email::MessageID" => "0",
    "Email::Simple" => "2.102",
    "Email::Simple::Creator" => "0",
    "Email::Simple::Header" => "0",
    "Encode" => "1.9801",
    "MIME::Base64" => "0",
    "MIME::Types" => "1.13",
    "Scalar::Util" => "0",
    "parent" => "0",
    "strict" => "0",
    "warnings" => "0"
  },
  "TEST_REQUIRES" => {
    "Capture::Tiny" => "0",
    "Symbol" => "0",
    "Test::More" => "0.96",
    "blib" => "0",
    "utf8" => "0"
  },
  "VERSION" => "1.923",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



