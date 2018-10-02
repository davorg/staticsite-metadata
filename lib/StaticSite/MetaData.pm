package StaticSite::MetaData;

use strict;
use warnings;

use Moo;
use Role::Tiny ();
use Carp;
use JSON;
use Types::Standard 'Enum';

has format => (
  is => 'ro',
  isa => Enum[qw(json yaml)],
  default => 'json',
);

sub BUILD {
  my $self = shift;
  my ($args) = @_;

  Role::Tiny->apply_roles_to_object(
    $self, 'StaticSite::MetaData::Role::' . uc $self->format
  );
}

sub extract {
  my $self = shift;
  my ($file) = @_;

  open my $fh, '<', $file or croak "Cannot open '$file': $!";

  local $/ = '';
  my $metadata = (<$fh>)[0];
}

sub get_metadata {
  my $self = shift;
  my ($file) = @_;

  return $self->parse($self->extract($file));
}

1;
