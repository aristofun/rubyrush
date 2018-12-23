# encoding: utf-8
#
# Программа, отправляющая почту с помощью гема pony
require 'pony'
require 'io/console'

my_mail = '<your username>@mail.ru'

puts "Введите пароль от вашей почты #{my_mail} для отправки письма:"
password = STDIN.noecho(&:gets).chomp

puts 'Кому отправить письмо? Введите адрес:'
send_to = STDIN.gets.chomp

puts 'Что написать в письме?'
body = STDIN.gets.encode('UTF-8').chomp

# Спросим у пользователя тему письма и сохраним в переменной subject
puts 'Какая будет тема письма?'
subject = STDIN.gets.encode('UTF-8').chomp

Pony.mail(
  # Первым параметром передаем тему, как раньше, только вместо фиксированной
  # строчки передаем переменную subject, в которую ранее записали ответ юзера.
  subject: subject,
  body: body,
  to: send_to,
  from: my_mail,
  via: :smtp,
  via_options: {
    address: 'smtp.mail.ru',
    port: '465',
    tls: true,
    user_name: my_mail,
    password: password,
    authentication: :plain
  }
)

puts 'Письмо отправлено!'
