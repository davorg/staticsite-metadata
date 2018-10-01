use strict;
use warnings;

use Test::More;
use FindBin '$Bin';
use StaticSite::MetaData;


my $file = "$Bin/data/test1.md";

my $md = StaticSite::MetaData->new;

ok(my $data = $md->get_metadata($file), 'Got some metadata');
is(ref $data, ref {}, 'Correct type of metadata');

is($data->{categories}, 'tooling', 'Category is correct');
is($data->{authors}[0], 'dave-cross', 'Author is correct');

done_testing;
