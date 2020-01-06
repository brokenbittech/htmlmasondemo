package Demo::Schema;

use Moose;
use base qw/DBIx::Class::Core/;

## Overrides the stock insert to be sure we are in a transaction
sub insert {
  my $self = shift;
  $self->result_source->storage->transaction_depth > 0
    || $self->throw_exception("INSERT while not in a txn()");
  return $self->SUPER::insert(@_);
}

## Overrides the stock update to be sure we are in a transaction
sub update {
  my $self = shift;
  $self->result_source->storage->transaction_depth > 0
    || $self->throw_exception("UPDATE while not in a txn()");
  return $self->SUPER::update(@_);
}

## Overrides the stock delete to be sure we are in a transaction
sub delete {
  my $self = shift;
  $self->result_source->storage->transaction_depth > 0
    || $self->throw_exception("DELETE while not in a txn()");
  return $self->SUPER::delete(@_);
}

1;  # Be excellent to one another