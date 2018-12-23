# Шифрование MD5, SHA1 

Напишите программу, которая шифрует введённое пользователем слово одним из механизмов MD5 или SHA1.

**Например:**

```sh
Введите слово или фразу для шифрования:
Хороший программист

Каким способом зашифровать:
1. MD5
2. SHA1
1

Вот что получилось:
9136d475e0fbf87e4fcdc9cb6c38ccc4
```

<div class="rubyrush-task-hint">

Для шифровки введённых пользователем данных, подключите модуль [Digest](http://ruby-doc.org/stdlib-2.1.0/libdoc/digest/rdoc/Digest.html) и воспользуйтесь функцией `Digest::MD5.hexdigest` или `Digest::SHA1.hexdigest`. 

В качестве параметра передайте нужную строку.

Почитайте также для чего нужны подобные методы и где они применяются:

https://ru.wikipedia.org/wiki/SHA-1

https://ru.wikipedia.org/wiki/MD5

</div>


<div class="rubyrush-task-answer">

<ul>
<li><a href="https://github.com/aristofun/rubyrush-path/blob/master/steps/github-03/solution/encrypt.rb" class="rubyrush-task-solution-link">Наше решение</a></li></ul>

</div>
