# Отправка почты с темой 

Сделайте так, чтобы в нашей программе `send_mail.rb` тема письма также вводилась пользователем из консоли при отправке.

<div class="rubyrush-task-hint">

Попросите пользователя кроме пароля, адреса отправки и тела письма указать также и тему письма, сохраните её в переменную `subject`. 

Укажите эту переменную `Pony` вместо стандартной темы в параметре `subject`:

```ruby
Pony.mail(
  subject: subject,
  body: body,
  ...
```

</div>


<div class="rubyrush-task-answer">

Перед запуском поменяйте почту на свою.

<ul>
<li><a href="https://github.com/aristofun/rubyrush-path/blob/master/steps/rubygems-03/solution/send_mail.rb" class="rubyrush-task-solution-link">Наше решение</a></li></ul>

</div>
