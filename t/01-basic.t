use strict;
use warnings;

use Test::More;
use StaticSite::MetaData;

use_ok('StaticSite::MetaData');

ok(my $md = StaticSite::MetaData->new, 'Got an object');
isa_ok($md, 'StaticSite::MetaData');

done_testing();
