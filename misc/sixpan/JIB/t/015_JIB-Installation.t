use Test::More 'no_plan';
use strict;

BEGIN { chdir 't' if -d 't' };
BEGIN { use lib qw[../lib inc] };
BEGIN { require 'conf.pl' }

use JIB::Config;
my $Class   = 'JIB::Installation';
my $Conf    = JIB::Config->new;
my @Acc     = qw[ meta_dir files_list control alternatives available 
                  registered_alternatives ];


use_ok( $Class );


### create an object 
my $Obj;
{   $Obj = $Class->new( dir => $INSTALLATION_DIR );
    ok( $Obj,                   "Object created" );
    isa_ok( $Obj,               $Class );
}    
    
    
    
# Local variables:
# c-indentation-style: bsd
# c-basic-offset: 4
# indent-tabs-mode: nil
# End:
# vim: expandtab shiftwidth=4:
