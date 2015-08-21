#!/usr/bin/perl
package Model::Trabajador;

use Moose;

extends 'Model::Persona';

has 'company' => (is => 'rw', isa => 'Str', default => 'Globant');

__PACKAGE__->meta->make_immutable;
no Moose;

1;
