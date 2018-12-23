# Контакты друзей 

Сделайте SQLite-базу с контактами ваших друзей и знакомых. Укажите там имя и фамилию каждого человека, телефон и email.

<div class="rubyrush-task-hint">

На уроке мы показали, как создать новую базу данных с помощью плагина для firefox, который называется SQLite Manager. 

Повторяйте за нами, но только создайте базу `contacts.sqlite`, а в ней таблицу `people` с нужными вам полями и заполните её данными ваших друзей.

</div>


<div class="rubyrush-task-answer">

Запрос для создания базы данных:

```sql
CREATE  TABLE "main"."people" ("first_name" TEXT, "second_name" TEXT, "phone" TEXT, "email" TEXT)
```

Запрос для добавления человека:

```sql
INSERT INTO people VALUES('Имя', 'Фамилия', '+7 999 000-00-00', 'email@example.com ')
```


</div>
