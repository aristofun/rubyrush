# Область видимости в классах 

Поймем еще раз «классовую» область видимости. 

1. Объявите переменную `variable`
1. После чего объявите класс `MyClass` и напишите у него конструктор, который создаёт переменную экземпляра `@variable`
1. Напишите у класса метод `check_variables`, который проверяет объявлены ли переменные `variable` и `@variable`

В основной программе создайте экземпляр класса `MyClass` и вызовите у него метод `check_variables`, а потом проверьте объявленность тех же переменных в основном тексте программы.

<div class="rubyrush-task-hint">

В этой задачке для простоты класс можно объявить прямо в тексте программы, не создавая дополнительных файлов. 

И после этого в тексте программы пользоваться им.

</div>


<div class="rubyrush-task-answer">

У вас должно получиться как-то так.

**Примерный результат:**

```sh
> ruby class_scope.rb 
В классе:
Переменная 'variable': 
Переменная '@variable': instance-variable
Вне класса:
Переменная 'variable': local-variable
Переменная '@variable':
```
<ul>
<li><a href="https://github.com/aristofun/rubyrush-path/blob/master/steps/memory-usage-04/solution/class_scope.rb" class="rubyrush-task-solution-link">Решение задачи</a></li></ul>

</div>
