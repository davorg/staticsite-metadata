package StaticSite::MetaData;

use strict;
use warnings;

use Moo;
use Carp;
use JSON;

sub extract {
  my $self = shift;
  my ($file) = @_;

  open my $fh, '<', $file or croak "Cannot open '$file': $!";

  local $/ = '';
  my $metadata = (<$fh>)[0];
}

sub parse {
  my $self = shift;
  my ($text) = @_;

  return JSON->new->decode($text);
}

sub get_metadata {
  my $self = shift;
  my ($file) = @_;

  return $self->parse($self->extract($file));
}

1;
