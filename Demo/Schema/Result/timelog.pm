package Demo::Schema::Result::timelog;
use namespace::autoclean;
use common::sense;
use Moose;
extends qw/Demo::Schema::Result/;

__PACKAGE__->load_components(qw/Core/);

__PACKAGE__->table('timelog');

__PACKAGE__->add_columns('id');
__PACKAGE__->set_primary_key('id');

__PACKAGE__->add_columns(qw/entry_date/);

__PACKAGE__->has_many(timelog_tasks => 'Demo::Schema::Result::timelog_tasks', 'timelog_id' );

=head1 METHODS

=cut

=head2 add_task($task_name)

Adds a new task to this log entry

=cut
sub add_task {
  my $self = shift;
  my $obj = shift;

  $self->txn( sub {
    # This is too small a project to roll a whole validation system
    exists($obj{task_name}) || $self->throw_exception("Must supply task name to add_task()");
    exists($obj{completed}) || $self->throw_exception("Must supply completed to add_task()")

    my $new_row = $self->create_related
      ( ''
      , { task_name => $task_name,  }
      )
  })
}


1;  # May the schwartz be with you