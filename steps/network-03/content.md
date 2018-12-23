# Валюта с ЦБ 

Еще одно задание, полезное в хозяйстве :)

Напишите программу, которая показывает текущие курсы валют. Информацию можно брать, например, с [сайта Центробанка](http://www.cbr.ru/scripts/XML_daily.asp).

**Пример результата:**

```sh
Доллар США: 66,1747 руб.
Евро: 73,9568 руб.
```

<div class="rubyrush-task-hint">

Всё аналогично «Погоде». 

Подгружаете информацию с помощью класса `Net::HTTP` и передаёте её в XML-парсер. На выходе получаете REXML-документ, в котором остаётся найти нужную информацию.

</div>


<div class="rubyrush-task-answer">


<ul>
<li><a href="https://github.com/aristofun/rubyrush-path/blob/master/steps/network-03/solution/currency.rb" class="rubyrush-task-solution-link">Наш способ решения</a></li></ul>

</div>
