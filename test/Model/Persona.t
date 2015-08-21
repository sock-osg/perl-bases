#!/usr/bin/perl
use strict;

use Test::More tests => 7;    # numero de tests a ejecutar
use Test::MockObject::Extends;

use lib $ENV{"HOME"} . "/workspace-perl2/perl-bases/main";

use_ok('Model::Persona');  ## Cuenta como prueba, cada subtest es otra prueba
use_ok('Model::Trabajador');
use_ok('Service::AddUserService');

subtest 'Prueba de sayHello' => sub {
    plan tests => 1;

    my $persona = Model::Trabajador->new({age => 200});
    #my $persona = new Model::Trabajador;

    $persona->_setFirstName("TESTA");
    $persona->lastName("TESTB");
    $persona->age(100);
    $persona->phone(["55123456789", "2184218424", "56+5695465445"]);
    $persona->sayHello();

    pass("Ejecutada correctamente la llamada a sayHello : " . $persona->sayHello());
};

subtest 'Prueba de sayHello inicializacion de parametros' => sub {
    plan tests => 1;

    my $persona = Model::Trabajador->new({
    	firstName => "INITA",
    	lastName => "INITB",
    	age => 200,
    	phone => ["55123456789", "2184218424", "56+5695465445"],
    	company => 'Pratsis'
    	});
    $persona->sayHello();

    pass("Ejecutada correctamente la llamada a sayHello : " . $persona->sayHello());
};

subtest 'Prueba de exito de guardado de nuevo trabajador' => sub {
    plan tests => 1;

    my $persona = Model::Trabajador->new({
    	firstName => "INITA",
    	lastName => "INITB",
    	age => 200,
    	phone => ["55123456789", "2184218424", "56+5695465445"],
    	company => 'Pratsis'
    	});
    my $mockUserDao = new Test::MockObject::Extends("Dao::UserDao");
    $mockUserDao->mock("saveUser", sub{ return 1});

    my $personService = Service::AddUserService->new({daoUser => $mockUserDao});

    is($personService->saveUser($persona), 1, "Trabajador almacenado correctamente");
};

subtest 'Prueba de error de guardado de nuevo trabajador' => sub {
    plan tests => 1;

    my $persona = Model::Trabajador->new({
    	firstName => "INITA",
    	lastName => "INITB",
    	age => 200,
    	phone => ["55123456789", "2184218424", "56+5695465445"],
    	company => 'Pratsis'
    	});
    my $mockUserDao = new Test::MockObject::Extends("Dao::UserDao");
    $mockUserDao->mock("saveUser", sub{ return 0});

    my $personService = Service::AddUserService->new({daoUser => $mockUserDao});

    is($personService->saveUser($persona), 0, "Trabajador no fue almacenado correctamente");
};

1;
