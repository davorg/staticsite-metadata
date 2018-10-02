package StaticSite::MetaData::Role::JSON;

use Moo::Role;
use Types::Standard 'InstanceOf';
use JSON;

has json_parser => (
  is => 'lazy',
  isa => InstanceOf['JSON'],
);

sub _build_json_parser {
  return JSON->new;
}

sub parse {
  my $self = shift;
  my ($text) = @_;

  return $self->json_parser->decode($text);
}

1;
