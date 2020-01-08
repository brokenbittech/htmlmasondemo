package Demo::Schema;

use common::sense;
use Moose;
use namespace::autoclean;
use base qw/DBIx::Class::Schema/;

my $DB_FILE = "./cdr.db";

__PACKAGE__->load_namespaces( result_namespace => '+Demo::Schema::Result' );

sub get_connection {
  my $self = shift;
  my $conn = __PACKAGE__->connect( "dbi:SQLite:$DB_FILE");

  # create the db file if missing
  if (not -e $DB_FILE) {
    $conn->deploy();
  }

  return $conn;
}

__PACKAGE__->meta->make_immutable;

1;  # Be excellent to one another