# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ActiveRecord::Base.connection.execute("ALTER SEQUENCE answers_id_seq RESTART WITH 1")

def parent_category(list, hash)
  key = hash.keys.first.to_sym
  objs = list.select do |i|
    i.send(key) == hash[key]
  end
  objs.first.id
end

# users = User.create!([{email: 'egor@mail.ru'}, {email: 'jora@mail.ru'}])

categories = Category.create!([{title: 'Frontend'}, {title: 'Backend'}, {title: 'WEB'}])
tests = Test.create!([
    {title: 'HTML', level: 1, user_id: 1, category_id: parent_category(categories, title: 'Frontend')},
    {title: 'CSS', level: 2, user_id: 1, category_id: parent_category(categories, title: 'Frontend')},
    {title: 'JS', level: 3, user_id: 1, category_id: parent_category(categories, title: 'Frontend')},
    {title: 'Query', level: 2, user_id: 1, category_id: parent_category(categories, title: 'Frontend')},
    {title: 'Ruby', level: 3, user_id: 1, category_id: parent_category(categories, title: 'Backend')},
    {title: 'RubyOnRails', level: 3, user_id: 1, category_id: parent_category(categories, title: 'Backend')},
    {title: 'HTTP', level: 1, user_id: 1, category_id: parent_category(categories, title: 'WEB')}
  ])

questions = Question.create!([
    {body: 'Что такое HTML?', test_id: parent_category(tests, title: 'HTML')},
    {body: 'Что означает www?', test_id: parent_category(tests, title: 'HTML')},
    {body: 'CSS - это...', test_id: parent_category(tests, title: 'CSS')},
    {body: 'CSS - это про визуальную или информационную составляющую?',
     test_id: parent_category(tests, title: 'CSS')},
    {body: 'Стандарт JS?', test_id: parent_category(tests, title: 'JS')},
    {body: 'Тип языка JS?', test_id: parent_category(tests, title: 'JS')},
    {body: 'Query это...', test_id: parent_category(tests, title: 'Query')},
    {body: 'Query подключается в ...', test_id: parent_category(tests, title: 'Query')},
    {body: 'Ruby это...', test_id: parent_category(tests, title: 'Ruby')},
    {body: 'Ruby: менеджер камней', test_id: parent_category(tests, title: 'Ruby')},
    {body: 'Рельсы', test_id: parent_category(tests, title: 'RubyOnRails')},
    {body: 'Рельсы-шпалы', test_id: parent_category(tests, title: 'RubyOnRails')},
    {body: 'HTTP это...(1)', test_id: parent_category(tests, title: 'HTTP')},
    {body: 'HTTP это...(2)', test_id: parent_category(tests, title: 'HTTP')}
  ])
answers = Answer.create!([
    {body: 'Аббревиатура консорциума', question_id: parent_category(questions, body: 'Что такое HTML?')},
    {body: 'Имя провайдера', question_id: parent_category(questions, body: 'Что такое HTML?')},
    {body: 'ГиперТекстМаркапЛенгвидж', question_id: parent_category(questions, body: 'Что такое HTML?'), correct: true},
    {body: 'Усиленная конструкция', question_id: parent_category(questions, body: 'Что означает www?')},
    {body: 'Тройное V', question_id: parent_category(questions, body: 'Что означает www?')},
    {body: 'Всемирная паутина', question_id: parent_category(questions, body: 'Что означает www?'), correct: true},
    {body: 'Василий Викторович Виктюк', question_id: parent_category(questions, body: 'Что означает www?')},
    {body: 'C.C.Catch', question_id: parent_category(questions, body: 'CSS - это...')},
    {body: 'КаскадСтайлШитс', question_id: parent_category(questions, body: 'CSS - это...'), correct: true},
    {body: 'Дорожная служба Германии', question_id: parent_category(questions, body: 'CSS - это...')},
    {body: 'Художница из Биберево', question_id: parent_category(questions, body: 'CSS - это про визуальную или информационную составляющую?')},
    {body: 'Красота сайта', question_id: parent_category(questions, body: 'CSS - это про визуальную или информационную составляющую?'), correct: true},
    {body: 'Модный плагин', question_id: parent_category(questions, body: 'CSS - это про визуальную или информационную составляющую?')},
    {body: 'Java', question_id: parent_category(questions, body: 'Стандарт JS?')},
    {body: 'JavaScript', question_id: parent_category(questions, body: 'Стандарт JS?')},
    {body: 'ECMA 2015', question_id: parent_category(questions, body: 'Стандарт JS?'), correct: true},
    {body: 'Динамический', question_id: parent_category(questions, body: 'Тип языка JS?'), correct: true},
    {body: 'Стратегический', question_id: parent_category(questions, body: 'Тип языка JS?')},
    {body: 'Новаторский', question_id: parent_category(questions, body: 'Тип языка JS?')},
    {body: 'Модный', question_id: parent_category(questions, body: 'Тип языка JS?')},
    {body: 'Фреймворк', question_id: parent_category(questions, body: 'Query это...')},
    {body: 'Библиотека', question_id: parent_category(questions, body: 'Query это...'), correct: true},
    {body: 'Инкубатор', question_id: parent_category(questions, body: 'Query это...')},
    {body: 'Симулятор', question_id: parent_category(questions, body: 'Query это...')},
    {body: 'Body', question_id: parent_category(questions, body: 'Query подключается в ...')},
    {body: 'Title', question_id: parent_category(questions, body: 'Query подключается в ...')},
    {body: 'Head', question_id: parent_category(questions, body: 'Query подключается в ...'), correct: true},
    {body: 'Footer', question_id: parent_category(questions, body: 'Query подключается в ...')},
    {body: 'Рубин', question_id: parent_category(questions, body: 'Ruby это...'), correct: true},
    {body: 'Желатин', question_id: parent_category(questions, body: 'Ruby это...')},
    {body: 'Магазин', question_id: parent_category(questions, body: 'Ruby это...')},
    {body: 'Nem', question_id: parent_category(questions, body: 'Ruby: менеджер камней')},
    {body: 'Pem', question_id: parent_category(questions, body: 'Ruby: менеджер камней')},
    {body: 'Gem', question_id: parent_category(questions, body: 'Ruby: менеджер камней'), correct: true},
    {body: 'Фреймворк', question_id: parent_category(questions, body: 'Рельсы'), correct: true},
    {body: 'Библиотека', question_id: parent_category(questions, body: 'Рельсы')},
    {body: 'Инкубатор', question_id: parent_category(questions, body: 'Рельсы')},
    {body: 'Симулятор', question_id: parent_category(questions, body: 'Рельсы')},
    {body: 'Rails on Ruby', question_id: parent_category(questions, body: 'Рельсы-шпалы')},
    {body: 'Ruby on Rails', question_id: parent_category(questions, body: 'Рельсы-шпалы'), correct: true},
    {body: 'Ruby за Ruby', question_id: parent_category(questions, body: 'Рельсы-шпалы')},
    {body: 'Протокол', question_id: parent_category(questions, body: 'HTTP это...(1)'), correct: true},
    {body: 'Узор', question_id: parent_category(questions, body: 'HTTP это...(1)')},
    {body: 'Матодор', question_id: parent_category(questions, body: 'HTTP это...(1)')},
    {body: 'Живой язык', question_id: parent_category(questions, body: 'HTTP это...(2)')},
    {body: 'Новая религия', question_id: parent_category(questions, body: 'HTTP это...(2)')},
    {body: 'Старый обряд', question_id: parent_category(questions, body: 'HTTP это...(2)')},
    {body: 'Протокол передачи гипертекста', question_id: parent_category(questions, body: 'HTTP это...(2)')}
  ])

# TestsUser.create!([
#     {user_id: users[0].id, test_id: tests[1].id},
#     {user_id: users[0].id, test_id: tests[2].id},
#     {user_id: users[0].id, test_id: tests[3].id},
#     {user_id: users[0].id, test_id: tests[4].id},
#     {user_id: users[0].id, test_id: tests[5].id},
#     {user_id: users[1].id, test_id: tests[3].id},
#     {user_id: users[1].id, test_id: tests[4].id},
#     {user_id: users[1].id, test_id: tests[5].id},
#     {user_id: users[1].id, test_id: tests[6].id}
#   ])
