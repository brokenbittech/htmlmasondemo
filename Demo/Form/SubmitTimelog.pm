package Demo::Form::SubmitTimelog;
use common::sense;
use HTML::FormHandler::Moose;
extends 'Demo::Form';
use Moose::Util::TypeConstraints;

has '+item_class' => ( default => 'SubmitTimelog' );

has_field 'forgive_id'  => (type => 'PosInteger', required => 1);
has_field 'object'      => (type => 'PosInteger', required => 1);
has_field 'type'        => (type => 'Text', required => 1);
has_field 'reason'      => (type => 'Text', required => 1);

sub validate_forgive_id {
=head2 validate_forgive_id
  Checks to make sure the forgive_id matches a record in one of the two tables indicated by forgive_type
=cut
  my $self = shift;
  my $field = shift;

  my $forgive_id = $field->value;
  return $field->add_error('Improperly formatted forgive id') unless ($forgive_id =~ m/^\d+$/);

  $self->DBH->resultset('test_schedule')->find($forgive_id) || $field->add_error("could not find id $forgive_id");
}

no HTML::FormHandler::Moose;
1; # derp