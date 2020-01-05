# app.psgi
use strict;
use HTML::Mason::PSGIHandler;
use Digest::MD5;
use Data::Dumper;

my $h = HTML::Mason::PSGIHandler->new(
    comp_root => "/home/broken-bit/work/htmlmason/app", # required
    data_dir => "/home/broken-bit/work/htmlmason/data_dir",
);

my $handler = sub {
    my $env = shift;
    warn "Starting request... to ". $env->{'REQUEST_URI'};
    # warn Dumper($env);

    $h->handle_psgi($env);
};