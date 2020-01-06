# app.psgi
use common::sense;
use HTML::Mason::PSGIHandler;
use Digest::MD5;
use Data::Dumper;

use LWP::JSON::Tiny;
use lib $ENV{PWD};
use Demo::Schema;

my $h = HTML::Mason::PSGIHandler->new(
    comp_root => "/home/broken-bit/work/htmlmason/app", # required
    data_dir => "/home/broken-bit/work/htmlmason/data_dir",
);

my $handler = sub {
    my $env = shift;
    print STDERR "\n--- Starting request... to ". $env->{'REQUEST_URI'} . "\n";
    $h->handle_psgi($env);
};