#!/usr/bin/pugs

use v6;
require Test;

plan 3;


my $fh = open $*PROGRAM_NAME;
ok($fh, "could open self");
isa_ok($fh, 'Handle');

my $line;
eval '
	$fh is chomped;
	$line = <$fh>;
';

todo_is($line, "#!/usr/bin/pugs", "first line was chomped");
