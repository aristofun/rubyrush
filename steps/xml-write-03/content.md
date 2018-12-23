# Превращаем XML визитку в HTML

Помните визитку в формате XML, которую вы делали в качестве ДЗ к прошлому уроку? 

А помните визитку в формате HTML, которую вы делали другом ДЗ к тому же уроку? 

Напишите программу, которая бы конвертировала XML визитку в HTML (да, нужно будет добавить поле с адресом фотки).

*ФИО* сделайте в HTML файле в виде заголовка (используя специальный тэг).

![визитка XML](http://goodprogrammer.ru/system/rich_texts/000/000/516e2b65adc1962cbb2fce1396820217336efc22882/vizitka_1.png?1443204246 "Пример XML-разметки файла с визиткой")

![визитка HTML](http://goodprogrammer.ru/system/rich_texts/000/000/517f5e9fd377be3bfc193766836fbf9d73de41e69ec/vizitka_2.png?1443204338 "А вот так он должен выглядеть в браузере")

<div class="rubyrush-task-hint">

Как читать данные из XML-файла вы уже знаете. Осталось научиться создавать XML-структуру.

С gem-ом [REXML](http://ruby-doc.org/stdlib-2.0.0/libdoc/rexml/rdoc/REXML.html) это довольно просто. Создайте новую структуру с помощью конструктора:

```ruby
html = REXML::Document.new
```

А дальше наполняйте её тегами с помощью методов `add_element` и `add_text` так, чтобы она выглядела, как ваша визитка, которую вы сделали в домашнем задании к прошлому уроку.

Как только закончите, запишите её в файл, открыв его для записи. Не забудьте дописать в начале файла инструкцию с указанием, что это HTML-документ:

```html
<!DOCTYPE HTML>
```

</div>


<div class="rubyrush-task-answer">

<p>
<a href="https://github.com/aristofun/rubyrush-path/tree/master/steps/xml-write-03/solution/" class="rubyrush-task-solution-link">Файлы решения</a>
</p>

</div>
