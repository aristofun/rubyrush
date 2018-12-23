# Чтение XML-визитки 

Сделайте свою визитку в формате XML. 

Укажите свои фамилию, имя, отчество, телефон, адрес электронной почты и немного напишите о своих навыках.

Напишите программу, которая читает эту визитку в формате XML и красиво выводит информацию на экран.

**Например:**

```sh
Иван А. Попов
+7 999 100-30-20, ivan.popov@mail.ru
Начинающий программист на Ruby
```

<div class="rubyrush-task-hint">

Создайте файл как мы показывали на уроке. Начните со служебной конструкции

```xml
<?xml version="1.0" encoding="utf-8"?>
```

Помните, что корневой элемент только один.

В программе откройте файл с помощью библиотеки **rexml** и достаньте все нужные поля с помощью метода elements.

```ruby
doc.root.elements["first_name"].text
```

Возможно, вам понадобится заглянуть в [инструкцию по использованию этой библиотеки](http://www.germane-software.com/software/rexml/docs/tutorial.html) (ещё [одна](http://www.germane-software.com/software/rexml/docs/tutorial.html), описание [класса REXML](https://ruby-doc.org/stdlib-2.4.1/libdoc/rexml/rdoc/REXML/Document.html)).

</div>


<div class="rubyrush-task-answer">


<p>
<a href="https://github.com/aristofun/rubyrush-path/tree/master/steps/xml-html-01/solution/" class="rubyrush-task-solution-link">Вариант решения задачи</a>
</p>

</div>
