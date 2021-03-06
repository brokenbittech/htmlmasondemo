package Demo::Schema::Result::quakes;

use Moose;
use namespace::autoclean;
use common::sense;
extends qw/Demo::Schema::Result/;

__PACKAGE__->load_components(qw/Core/);
__PACKAGE__->table('quakes');


# TODO  I can make this dynamic by parsing the CSV header and adding here
__PACKAGE__->add_columns(qw/
I_D	FLAG_TSUNAMI	YEAR	MONTH	DAY	HOUR	MINUTE	SECOND	FOCAL_DEPTH	EQ_PRIMARY	EQ_MAG_MW	EQ_MAG_MS	EQ_MAG_MB	EQ_MAG_ML	EQ_MAG_MFA	EQ_MAG_UNK	INTENSITY	COUNTRY	STATE	LOCATION_NAME	LATITUDE	LONGITUDE	REGION_CODE	DEATHS	DEATHS_DESCRIPTION	MISSING	MISSING_DESCRIPTION	INJURIES	INJURIES_DESCRIPTION	DAMAGE_MILLIONS_DOLLARS	DAMAGE_DESCRIPTION	HOUSES_DESTROYED	HOUSES_DESTROYED_DESCRIPTION	HOUSES_DAMAGED	HOUSES_DAMAGED_DESCRIPTION	TOTAL_DEATHS	TOTAL_DEATHS_DESCRIPTION	TOTAL_MISSING	TOTAL_MISSING_DESCRIPTION	TOTAL_INJURIES	TOTAL_INJURIES_DESCRIPTION	TOTAL_DAMAGE_MILLIONS_DOLLARS	TOTAL_DAMAGE_DESCRIPTION	TOTAL_HOUSES_DESTROYED	TOTAL_HOUSES_DESTROYED_DESCRIPTION	TOTAL_HOUSES_DAMAGED	TOTAL_HOUSES_DAMAGED_DESCRIPTION
/);
__PACKAGE__->set_primary_key('I_D');

1;  # May the schwartz be with you