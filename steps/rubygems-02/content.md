# Транслитератор 

Напишите программу-транслитератор: программу, которая берёт русский текст и переводит его в созвучный английский. А если пользователь ввел фразу на английском, программа должна транслитерирорвать на русский.

**Например:**

```
Введите фразу для транслитерации:
Отличный ёж
Otlichnyy yezh
```

**или:**

```
Введите фразу для обратной транслитерации:
Mama mila ramu
Мама мила раму
```

<div class="rubyrush-task-hint">

Конечно, Вам понадобится для этого какая-то библиотека.

Вот Вам некоторые:

https://github.com/tjbladez/translit
https://github.com/dalibor/cyrillizer
https://github.com/yaroslav/russian
https://github.com/torbjon/translit_net

Сами разберитесь, как ими пользоваться.

Чтобы проверить, на каком языке фраза можно, например, сравнить её с транслитерированным вариантом.

Например, если при транслитерации в английский ничего не поменялось — фраза на английском.

</div>


<div class="rubyrush-task-answer">

Перед запуском установите библиотеку `cyrillizer`:

```sh
gem install cyrillizer
```
<ul>
<li><a href="https://github.com/aristofun/rubyrush-path/blob/master/steps/rubygems-02/solution/translit.rb" class="rubyrush-task-solution-link">Наш вариант решения</a></li>
</ul>

</div>
