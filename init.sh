#!/bin/bash
#posicionarse en evader/
cd evader;
#instalar las gemas necesarias
bundle install
#ejecutar las migraciones para generar las tablas
bundle exec rake db:migrate
#llenar la base de datos con los datos iniciales
bundle exec rake db:seed
#iniciar el servidor
bundle exec rails s


#para ejecutar los test de clientes
#bundle exec rake test test/models/client_test.rb
#para ejecutar los test de facturas
#bundle exec rake test test/models/bill_test.rb