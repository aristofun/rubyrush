# Проверяем email 

Напишите программу, которая проверяет является ли введенный текст email-ом.

**Например:**

```sh
$ ruby email.rb 
Введите email:
install.vv@gmail.com
Спасибо!

$ ruby email.rb 
Введите email:
Какая-то фигня!
Это не email
```

<div class="rubyrush-task-hint">

В качестве регулярного выражения для проверки почты, можно использовать такое:

```ruby
/^[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+$/i
```

Сами разберитесь, что оно делает, или посмотрите ответ.

</div>


<div class="rubyrush-task-answer">


<ul>
<li><a href="https://github.com/aristofun/rubyrush-path/blob/master/steps/regexp-01/solution/email.rb" class="rubyrush-task-solution-link">наше решение с разбором регулярки</a></li></ul>

</div>
