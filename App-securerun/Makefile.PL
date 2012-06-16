use 5.014002;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'App::securerun',
    VERSION_FROM      => 'lib/App/securerun.pm', # finds $VERSION
    PREREQ_PM         => {'HTML::Parser' => 3.35, 'HTML::Tagset' => 3.03 }, # e.g., Module::Name => 1.1
    PL_FILES          => {'bin/install-bin.PL' => 'bin/securerun'},
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/App/securerun.pm', # retrieve abstract from module
       AUTHOR         => 'B. Estrade <estrabd@gmail.com') : ()),
);
