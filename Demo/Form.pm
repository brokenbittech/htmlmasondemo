package Demo::Form;

use common::sense;
use Moose;
use namespace::autoclean;

extends 'HTML::FormHandler';

# I may need ot add exception handling or failed validation
# standardization for multiple forms, and this base class would be
# the perfect place.

# This is also a great place to fetch the database handle and provide
# the validators -- important when validation requires database lookups

sub DBH {
  return Demo::Schema->instance();
}

__PACKAGE__->meta->make_immutable;


1;  # feed me Seymore!