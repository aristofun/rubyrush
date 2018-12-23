# Символы мастей 

Улучшите программу `pick_a_card`, сделав так, чтобы вместо слова «Бубей» или «of Diamonds» выводился Unicode символ соответствующей масти: ♦, ♠, ♥ или ♣.

**Пример результата:**

```sh
> ruby pick_a_card.rb
Q♠
```

Закоммитьте изменения в репозиторий на github.

<div class="rubyrush-task-hint">

Как и в предыдущем уроке с кубиками, создайте массив с [символами мастей](https://en.wikipedia.org/wiki/Playing_cards_in_Unicode) вместо массива со строками их названий.

</div>


<div class="rubyrush-task-answer">

Откройте консоль, зайдите в папку приложения `pick_a_card`. Измените файл `pick_a_card.rb` в соответствии с заданием или замените его файлом из нашего ответа.

Посмотрите изменения, набрав команду:

```sh
git diff
```

Проверьте решение, набрав `ruby pick_a_card.rb`.

Если все хорошо, добавьте программу в список изменения для комита:

```sh
git add pick_a_card.rb
```

Сделайте комит:

```sh
git commit -m "Unicode suit symbols"
```

Посмотрите историю изменений:

```sh
git log
```

Отправьте комит на удаленный репозиторий:

```sh
git push
```

Посмотрите, какой список комитов в удалённом репозитории по адресу (вместо `user_name` подставьте название своего аккаунта на github):

```
https://github.com/user_name/pick_a_card/commits/master
```

<ul>
<li><a href="https://github.com/aristofun/rubyrush-path/blob/master/steps/github-02/solution/pick_a_card.rb" class="rubyrush-task-solution-link">Наше решение</a></li></ul>


</div>
