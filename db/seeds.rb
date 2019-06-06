# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([{title: 'Frontend'}, {title: 'Backend'}, {title: 'WEB'}])
Test.create(
  [
    {title: 'HTML', level: 1, category_id: 1},
    {title: 'CSS', level: 2, category_id: 1},
    {title: 'JS', level: 3, category_id: 1},
    {title: 'Query', level: 2, category_id: 1},
    {title: 'Ruby', level: 3, category_id: 2},
    {title: 'RubyOnRails', level: 3, category_id: 2},
    {title: 'HTTP', level: 1, category_id: 3}
  ])
Question.create(
  [
    {body: 'Что такое HTML?', test_id: 1},
    {body: 'Что означает www?', test_id: 1},
    {body: 'CSS - это...', test_id: 2},
    {body: 'CSS - это про визуальную или информационную составляющую?', test_id: 2},
    {body: 'Стандарт JS?', test_id: 3},
    {body: 'Тип языка JS?', test_id: 3},
    {body: 'Query это...', test_id: 4},
    {body: 'Query подключается в ...', test_id: 4},
    {body: 'Ruby это...', test_id: 5},
    {body: 'Ruby: менеджер камней', test_id: 5},
    {body: 'Рельсы', test_id: 6},
    {body: 'Рельсы-шпалы', test_id: 6},
    {body: 'HTTP это...(1)', test_id: 7},
    {body: 'HTTP это...(2)', test_id: 7},
  ])
Answer.create(
  [
    {body: 'Аббревиатура консорциума', question_id: 1},
    {body: 'Имя провайдера', question_id: 1},
    {body: 'ГиперТекстМаркапЛенгвидж', question_id: 1, correct: true},
    {body: 'Усиленная конструкция', question_id: 1},
    {body: 'Тройное V', question_id: 2},
    {body: 'Всемирная паутина', question_id: 2, correct: true},
    {body: 'Василий Викторович Виктюк', question_id: 2},
    {body: 'C.C.Catch', question_id: 3},
    {body: 'КаскадСтайлШитс', question_id: 3, correct: true},
    {body: 'Дорожная служба Германии', question_id: 3},
    {body: 'Художница из Биберево', question_id: 4},
    {body: 'Красота сайта', question_id: 4, correct: true},
    {body: 'Модный плагин', question_id: 4},
    {body: 'Java', question_id: 5},
    {body: 'JavaScript', question_id: 5},
    {body: 'ECMA 2015', question_id: 5, correct: true},
    {body: 'Динамический', question_id: 6, correct: true},
    {body: 'Стратегический', question_id: 6},
    {body: 'Новаторский', question_id: 6},
    {body: 'Модный', question_id: 6},
    {body: 'Фреймворк', question_id: 7},
    {body: 'Библиотека', question_id: 7, correct: true},
    {body: 'Инкубатор', question_id: 7},
    {body: 'Симулятор', question_id: 7},
    {body: 'Body', question_id: 8},
    {body: 'Title', question_id: 8},
    {body: 'Head', question_id: 8, correct: true},
    {body: 'Footer', question_id: 8},
    {body: 'Рубин', question_id: 9, correct: true},
    {body: 'Желатин', question_id: 9},
    {body: 'Магазин', question_id: 9},
    {body: 'Nem', question_id: 10},
    {body: 'Pem', question_id: 10},
    {body: 'Gem', question_id: 10, correct: true},
    {body: 'Фреймворк', question_id: 11, correct: true},
    {body: 'Библиотека', question_id: 11},
    {body: 'Инкубатор', question_id: 11},
    {body: 'Симулятор', question_id: 11},
    {body: 'Rails on Ruby', question_id: 12},
    {body: 'Ruby on Rails', question_id: 12, correct: true},
    {body: 'Ruby за Ruby', question_id: 12},
    {body: 'Протокол', question_id: 13, correct: true},
    {body: 'Узор', question_id: 13},
    {body: 'Матодор', question_id: 13},
    {body: 'Живой язык', question_id: 14},
    {body: 'Новая религия', question_id: 14},
    {body: 'Старый обряд', question_id: 14},
    {body: 'Протокол передачи гипертекста', question_id: 14}
  ])
