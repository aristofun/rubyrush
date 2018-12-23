# Где что объявлено? 

Объявить три переменных:

1. Глобальную переменную `$a`
2. Локальную переменную `b`
3. Переменную `c` внутри метода `method`

Проверить объявлена ли каждая из них: внутри метода `method` и в основном тексте программы.

**Пример результата:**

```
> ruby scopes.rb
Переменная '$a': global-variable
Переменная 'b':
Переменная 'c': local-variable
Переменная '$a': global-variable
Переменная 'b': local-variable
Переменная 'c':
```

<div class="rubyrush-task-hint">

Напомню, что выяснить, определена ли переменная можно методом `defined?`

</div>


<div class="rubyrush-task-answer">


<ul>
<li><a href="https://github.com/aristofun/rubyrush-path/blob/master/steps/memory-usage-03/solution/scopes.rb" class="rubyrush-task-solution-link">Решение задачи</a></li></ul>

</div>
