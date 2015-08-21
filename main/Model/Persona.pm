#!/usr/bin/perl
package Model::Persona;

use Moose;

use constant X => 500 + 200;
use constant {
    DEFAUL_FIRSTNAME => 'XXX',
    DEFAUL_LASTNAME => 'YYY',
};

has 'firstName' => (
	is => 'rw',
	isa => 'Str',
	writer => '_setFirstName',
	reader => '_getFirstName',
	default => DEFAUL_FIRSTNAME);
has 'lastName' => (is => 'rw', isa => 'Str', default => sub {
	return DEFAUL_LASTNAME
	});
has 'age' => (
	is => 'rw',
	isa => 'Num|Int',
	required => 1);
has 'phone' => (is => 'rw', isa => 'ArrayRef[Str]');

sub sayHello {
	my ($self) = @_;
	return "Hello ". $self->{'firstName'} . " " . $self->{'lastName'};
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;
