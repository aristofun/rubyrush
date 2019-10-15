# Среднее арифметическое трех чисел 

Напишите программу, которая находит среднее арифметическое трех, введенных пользователем целых чисел.

**Например:**

```ruby
Введите число 1:
> -23
Введите число 2:
> 42
Введите число 3:
> 5

Среднее арифметическое: 8
```

<div class="rubyrush-task-hint">

Просто записывайте введенные пользователем числа в разные переменные. А потом снова вычислите среднее арифметическое этих чисел и выведите его на экран:

```
number1 = gets.chomp
...
average = (number1 + number2 + number3) / 3
```

Не забудьте, что метод `gets` возвращает строки, сделать из строки число можно с помощью метода `to_i`:

``` rb
number = gets.to_i
```

</div>


<div class="rubyrush-task-answer">


<ul>
<li><a href="https://github.com/aristofun/rubyrush-path/blob/master/steps/gets-butovo-01/solution/average.rb" class="rubyrush-task-solution-link">Наш вариант решения</a></li></ul>

</div>
