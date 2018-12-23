# Калькулятор с Float 

Напишите калькулятор, который работает с числами с плавающей точкой.
 
Обратите внимание, что в этом случае на ноль делить можно (получится бесконечность `Infinity`) и не надо ловить исключения.

**Например:**

```
Первое число:
> 92.7
Второе число:
> 0
Выберите операцию (+ - * /):
> /
Результат:
Infinity
```

<div class="rubyrush-task-hint">

Для того, чтобы перевести введённые пользователем данные в числа с плавающей точкой, используйте метод строки `to_f`:

```
number = gets.to_f
```

В этом случае конструкция `begin-rescue` уже не нужна.

</div>


<div class="rubyrush-task-answer">


<ul>
<li><a href="https://github.com/aristofun/rubyrush-path/blob/master/steps/errors-exceptions-02/solution/calculator_float.rb" class="rubyrush-task-solution-link">Наше решение</a></li></ul>

</div>
