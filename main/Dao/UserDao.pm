#!/usr/bin/perl
package Dao::UserDao;

use Moose;

has 'dbConnection' => (is => 'ro', lazy => 1, builder => '_initDbConnection');
sub _initDbConnection {
	return 'MySQLConnection';
}

sub saveUser {
	my ($self, $trabajador) = @_;
	return 1;
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;
