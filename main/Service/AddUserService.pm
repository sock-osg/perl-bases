#!/usr/bin/perl
package Service::AddUserService;

use Moose;

has 'daoUser' => (is => 'rw', isa => 'Dao::UserDao');

sub saveUser {
	my ($self, $trabajador) = @_;
	return $self->{'daoUser'}->saveUser($trabajador);
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;
