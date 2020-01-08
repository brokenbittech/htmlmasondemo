#!/usr/bin/perl

# this will grab the USGS earthquake database and populate it in our SQLite database

use common::sense;
use Parse::CSV qw//;
use LWP::Simple qw//;
use lib qw(.);
use Demo::Schema;

my $quakefile = "quakefile.csv";
unlink 'cdr.db';  # nuke the existing db


my $url = qw(https://www.ngdc.noaa.gov/nndc/struts/results?bt_0=&st_0=&type_17=EXACT&query_17=None+Selected&op_12=eq&v_12=&type_12=Or&query_14=None+Selected&type_3=Like&query_3=&st_1=&bt_2=&st_2=&bt_1=&bt_4=&st_4=&bt_5=&st_5=&bt_6=&st_6=&bt_7=&st_7=&bt_8=&st_8=&bt_9=&st_9=&bt_10=&st_10=&type_11=Exact&query_11=&type_16=Exact&query_16=&bt_18=&st_18=&ge_19=&le_19=&type_20=Like&query_20=&display_look=189&t=101650&s=1&submit_all=Search+Database);

if (not -e $quakefile) {
  my $data = LWP::Simple::getstore($url, $quakefile);
}

my $parser = Parse::CSV->new
  ( file => $quakefile,
    sep_char => "\t",
    names => 1,
    blank_is_undef => 0

  ) || die "could not create CSV parser $@";

my $db = Demo::Schema->get_connection();

while (my $row = $parser->fetch) {
  $db->resultset('quakes')->create($row);
}
