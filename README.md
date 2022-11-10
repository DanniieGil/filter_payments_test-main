# Prueba briq.mx - Filtrar pagos recibidos

[Instrucciones](https://www.notion.so/briqmx/Filtrar-pagos-recibidos-fb22239ceefa4067a0f9f8e9a5ac7582)

## ¿Cómo correr el app?

Para correr la aplicación necesitas:

* Ruby 3.1.0
* Postgres y Redis

Instala las dependencias de ruby con:

```
bundle install
```

Puedes preparar la base de datos con:

```
bin/rails db:setup # Este comando ya corre los seeds
```

Puedes correr el app con:

```
bin/rails server
```

Puedes correr las pruebas con:

```
bundle exec rspec
```
