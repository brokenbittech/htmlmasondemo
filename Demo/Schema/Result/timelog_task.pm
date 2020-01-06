package Demo::Schema::Result::timelog_task;
use namespace::autoclean;
use common::sense;
use Moose;
extends qw/Demo::Schema::Result/;

__PACKAGE__->load_components(qw/Core/);

__PACKAGE__->table('timelog_task');

__PACKAGE__->add_columns('id');
__PACKAGE__->set_primary_key('id');

__PACKAGE__->add_columns(qw/task_name complete/);

__PACKAGE__->belongs_to(timelog => 'Demo::Schema::Result::timelog', {'foreign.id' => 'self.timelog.id'});


=head1 METHODS

=cut
