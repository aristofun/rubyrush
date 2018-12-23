# Понять, объявлена ли переменная 

Найдите в интернете способ выяснить объявлена ли переменная, и напишите программу, которая пишет, объявлены ли переменные `a` и `b`. 

Затем объявите переменную `a` и запустите программу. 

**Получится примерно так:**

```sh
Переменная 'a' определена
Переменная 'b' не определена
```

<div class="rubyrush-task-hint">

Выяснить, определена ли переменная можно методом `defined?`

```ruby
if defined?(a)
  puts "Определена переменная a"
end
```

</div>


<div class="rubyrush-task-answer">


<ul>
<li><a href="https://github.com/aristofun/rubyrush-path/blob/master/steps/memory-usage-02/solution/defined.rb" class="rubyrush-task-solution-link">Решение задачи</a></li></ul>

</div>
