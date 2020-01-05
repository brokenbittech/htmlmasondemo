
<%perl>
my $apiurl = 'http://api.icndb.com/jokes/random/?limitTo=nerdy';

my $chuck_norris = LWP::UserAgent::JSON
  ->new()
  ->request(HTTP::Request::JSON->new(GET => $apiurl))
  ->json_content->{'value'}->{'joke'};

</%perl>
<% $chuck_norris; %>
