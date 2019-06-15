# README

### Для чего

Программа позволяет корректно расчитать 
требуемое время на разработку, используя методологию из системы
[PERT](https://ru.wikipedia.org/wiki/PERT)

### Окружение

    ruby  - 2.6.3
    rails - 5.2.3

### Установка

Создайте свой `gemset`, затем выполните команды

    gem install bundler
    bundle
    bundle exec rake db:create
    bundle exec rake db:migrate
    bundle exec rake db:schema:load RAILS_ENV=test
    
Запускаем сервер и пользуемся

### Тесты

    bundle exec rspec/spec

![](https://evaluation-of-development-time.herokuapp.com/pert_coverage.png)
