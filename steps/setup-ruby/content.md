# Установка и настройка Ruby 

 Правильное программирование начинается с установки необходимых инструментов. 


<!-- youtube starts here -->
<script>
var videoPlan = {}
</script>

<div class="embed-responsive embed-responsive-16by9 rubyrush-video" id="video-0">
<iframe src="https://www.youtube.com/embed/h0_uKss31Z4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<script>
videoPlan["video-0"] = [{"begin":"1:53","comment":"Приветствие и план урока"},{"begin":"3:08","comment":"Как устроена любая программа?"},{"begin":"5:10","comment":"Установка текстового редактора Sublime"},{"begin":"10:25","comment":"Устанавливаем Ruby (v. 2.*.*)"},{"begin":"12:16","comment":"Что такое консоль (командная строка)"},{"begin":"13:57","comment":"Запускаем первую программу!"},{"begin":"15:20","comment":"Итоги урока"}]
</script>
</div>


<div class="embed-responsive embed-responsive-16by9 rubyrush-video" id="video-1">
<iframe src="https://www.youtube.com/embed/cfvh5QBj4RM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<script>
videoPlan["video-1"] = [{"begin":"2:10","comment":"Приветствие и план урока"},{"begin":"3:28","comment":"Как устроена любая программа?"},{"begin":"5:12","comment":"В чём отличие для пользователей Mac OS X"},{"begin":"6:20","comment":"Рабочее место: Установка Sublime"},{"begin":"8:35","comment":"Рабочее место: создаём рабочую папку"},{"begin":"11:12","comment":"Пишем первую программу «Привет, мир!»"},{"begin":"12:50","comment":"Рабочее место: программа Terminal"},{"begin":"14:58","comment":"Запускаем нашу первую программу"},{"begin":"19:42","comment":"Итоги урока"}]
</script>
</div>


<div class="embed-responsive embed-responsive-16by9 rubyrush-video" id="video-2">
<iframe src="https://www.youtube.com/embed/w7gB8mkX38g" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<script>
videoPlan["video-2"] = [{"begin":"1:26","comment":"Установка RVM"},{"begin":"3:40","comment":"Установка свежего Ruby"},{"begin":"4:59","comment":"Что делать, если ошибки?"}]
</script>
</div>

 <!-- youtube ends here --> 

> «Методов вагон и маленькая тележка, а вот принципов совсем немного. Тому, кто усвоил принципы, ничего не стоит выбрать тот или иной метод. А вот тому, кто ищет метод, не обращая внимания на принципы, придется туго.»

*— Ральф Эмерсон, поэт и эссеист*

### Как устроена программа

Программа это набор инструкций для компьютера, написанный человеком.

Чтобы написать программу нужен человек, который будет писать и текстовый редактор, в котором писать текст.

![Человек и текст](http://goodprogrammer.ru/system/rich_texts/000/000/09902b9b4a6bf1028b0470dc20896b19af428ad4d17/1.png?1429385637 "Человек пишет программу в виде текста")

Для того, чтобы компьютер понял текст, написанный человеком, нужен специальный инструмент компилятор или интерпретатор. Интерпретатор «переводит» текст, понятный человеку, в код, понятный компьютеру.

Это такая своеобразная «мясорубка», которая, как и человек, понимает какой-то язык программирования и переводит инструкции этого языка в язык компьютерных команд.

![Человек, текст и мясорубка](http://goodprogrammer.ru/system/rich_texts/000/000/100d46edd10c5773fd7c49d377573e59cb3780f1bad/2_1.png "Написанный человеком текст нужно преобразовать в команды компьютера")

В нашем курсе мы будем использовать в качестве такого интерпретатора Ruby.

После того, как программа преобразована в инструкции компьютера, компьютер может их выполнять и отображать какой-то результат.

![Структура процесса программирования](http://goodprogrammer.ru/system/rich_texts/000/000/101ea4d96457e955db2184ab6c352b076a96c805611/2_2.png "Программа в виде команд передается в процессор и выполняется")

Так устроена по сути любая современная технология, любой современный язык. Пройдем по шагам эту цепочку на примере языка Ruby и заодно установим все нужные инструменты.

### Текстовый редактор Sublime

Нам нужен способ писать программы. Для удобства существуют специальные редакторы, они помогают и подсказывают программисту в процессе написания программ. Мы скачиваем и устанавливаем один из таких редакторов — **Sublime**.

Скачайте подходящую для вашей системы версию на [официальном сайте](http://www.sublimetext.com/) и установите как обычную программу.

![Установка Sublime](http://goodprogrammer.ru/system/rich_texts/000/000/102c801a47631af9aca8574b1fa3e6b48aac3c6b099/3.png?1429385637 "Окно установщика sublime в Windows")

Можете воспринимать его как блокнот или даже как редактор Word. Но в отличие от этих двух, он умеет раскрашивать текст на языке Ruby так, что становится очень наглядно и удобно писать программы.

Далее мы еще будем касаться некоторых особенностей его работы. Но помните, что по сути своей это просто текстовый редактор.

### Рабочая папка для уроков

Для хранения всех программ этого курса мы рекомендуем вам создать новую папку `rubytut` в корне вашего диска (или в домашней директории на Mac OS X) — подробнее смотри видеоурок.

В созданной папке создайте папку нашего первого урока `lesson2` В эту папку Мы положим нашу первую программу `hello.rb`. Обратите внимание на расширение `.rb` — все файлы на языке Ruby имеют расширение .rb

```ruby
puts "Привет, смешной мир!"
```

Вот так и выглядит наша первая, самая простая программа на Ruby. Создайте файл с таким содержимым в редакторе Sublime и сохраните в папке этого урока `lesson2`, назвав `hello.rb`.

### Сохранение файлов в кодировке UTF-8

Небольшое замечание. Крайне важно, чтобы все файлы, которые вы будете делать при прохождении этого курса, были в кодировке UTF-8. Не будем сейчас подробного на этом останавливаться, просто всегда сохраняйте ваши документы первый раз вот таким способом:

```
File → Save with Encoding → UTF-8
```

или, если у вас русская версия

```
Файл → Сохранить в кодировке → UTF-8
```

и уже только потом выбирайте название для нового файла.

Итак, текст нашей программы сохранён в файле `hello.rb` в нужной кодировке. Теперь нам осталось только ее запустить. А для этого нам не хватает самого языка Ruby!

### Как установить Ruby

Установим, наконец, наш Ruby!

Пользователи Mac OS X могут пропустить этап установки Ruby, поскольку он уже установлен в систему. Переходите сразу к следующему параграфу.

Для Windows есть специальная версия руби — **rubyinstaller**, скачайте с [официального сайта](http://rubyinstaller.org/) свежую версию, подходящую под вашу систему (32 или 64 бита).

После этого запускаем его, нажимаем все нужные кнопки как при установке любой программы и ждем, пока установка закончится.

ВАЖНО! Отметьте две галочки на одном из шагов установки как на этой картинке:

![Установка Ruby](http://goodprogrammer.ru/system/rich_texts/000/000/1033fbfbd72f7a482d6f4416e7a716e88a70700a536/4.png?1429385637 "Окно RubyInstaller на Windows")

Итак, руби установлен. А как же теперь сказать ему, чтобы он запустил нашу первую программу `hello.rb`?

Для этого воспользуемся еще одним полезным инструментом — консолью.

### Как запускать программы с помощью консоли

Консоль или командная строка (или терминал в Mac OS X) — это специальная программа, которая позволяет в специальном окне с текстовым интерфейсом делать различные операции: создавать, перемещать файлы и папки, запускать и останавливать программы, вводить и выводить информацию в компьютер.

Другими словами, консоль — это как обычная операционная система, только без окошек, без графики, без рюшечек. Все операции нужно писать текстом в специальном окне.

Это самый важный и популярный для программиста инструмент. В этом курсе почти все наши программы мы будем запускать и использовать с помощью консоли.

Вы на собственном примере убедитесь далее, что даже в текстовом интерфейсе можно сделать много полезных, увлекательных и даже красивых игр и программ.

Откроем консоль. Для этого вызываем поиск по программам: клавиша Пуск и начинаем набирать, или Ctrl+Пробел в Mac OS X для вызова Spotlight. В этой строке поиска наберите «Командная строка» или «command line» («terminal» в Mac OS X).

![Как запустить командную строка в Windows 7](http://goodprogrammer.ru/system/rich_texts/000/000/104609bb0a04ef9a359bfa3944f410329af7cc9c6ca/5_01_win7.png?1429385637 "Как запустить командную строку в Windows 7/Vista")

![Как запустить командную в Windows 8](http://goodprogrammer.ru/system/rich_texts/000/000/105db4208b629bf315764d4d03f05d7de15e964a7ed/5_02_win8.png?1429385637 "Как запустить командную строку в Windows 8")

![Как запустить командную в Mac OS X](http://goodprogrammer.ru/system/rich_texts/000/000/106cefa1ee62d458303515879d4c64f2819dbf5da3b/5_03_mac.png?1429385637 "Как запустить консоль в Mac OS X")

Видите простое окно с каким-то текстом на черном или белом фоне? Это и есть наша консоль.

![Командная строка в Windows 7](http://goodprogrammer.ru/system/rich_texts/000/000/107e3b6ee81f9581e765a5923ea907e0e237f654a3f/6.png?1429385637 "Экран консоли в Windows")

Советую закрепить ее в панели задач (в Доке на Маке) — правой кнопкой мыши по значку запущенной программы и выбрать пункт меню что-то про «закрепить» в панели задач или в Доке. Тогда в следующий раз вы сможете запустить ее прямо из панели задач, не нужно будет опять искать эту программу.

В консоли напишите `ruby -v`  и нажмите Enter и посмотрите что произойдет

```sh
ruby -v
```

Этим мы сказали консоли: «запусти команду `ruby` и передай ей параметр `-v`», а когда руби запустился, он прочитал этот параметр, означающий: «выведи свою версию и закройся».

Если вы правильно установили Ruby, то в консоли выведется информация об установленной версии.

![Просмотр версии Ruby](http://goodprogrammer.ru/system/rich_texts/000/000/10854aebfd0012681ddbf86e1e2a7438582146e6291/7.png?1429385637 "Просмотр версии Ruby")

Таким способом и происходит запуск программ и отображение результатов в консоли.

Другая важная идея: консоль всегда находится в какой-то папке (в этом смысле она похожа на программу Проводник), в Windows текущая папка написана слева от курсора — это полный путь к папке.

В Mac OS X чтобы узнать полный путь текущей папки, надо в консоли набрать команду `pwd` и нажать Enter.

Текущая папка важна для запуска программ. Чтобы перейти в другую папку в консоли есть встроенная команда `cd`.

Для того, чтобы перейти в нашу рабочую папку, нужно в консоли написать:

```sh
cd c:\rubytut\lesson2
```

Вместо `c:\rubytut\lesson2` вы должны указать полный путь к папке 2-го урока, которую вы создали ранее. Если он у вас отличается от нашего.

Подробнее о работе в консоли в Windows и Mac OS X смотрите видео 2-го урока и дополнительные ссылки.

### Первая программа Hello World на Ruby

Запускаем нашу новую программу `hello.rb`

Теперь когда вы находитесь в той же папке, где у вас лежит файл `hello.rb`, наберите в консоли команду `ruby` и через пробел имя этого файла, нажмите Enter.

```sh
ruby hello.rb
```

Эта команда говорит консоли: «Запусти Ruby и скажи ему, что нужно выполнить файл `hello.rb` из текущей папки.» В ответ на это запускается программа Ruby и отвечает: «Так, вижу файл, выполняю.» После выполнения программы Руби закрывается.

Если при установке руби была ошибка, то консоль ругнется и скажет, что она не знает такой команды `ruby`.

Если же вы не перешли в правильную папку или в ней нету файла `hello.rb`, то ругаться будет уже Руби. Он сообщит в консоли что-то вроде: «не вижу такого файла, нечего выполнять».

Конечно все сообщения об ошибках будут на английском языке, но их не нужно дословно понимать.

Если же вы всё сделали правильно, программа радостно с вами поздоровается:

```sh
Привет, смешной мир!
```

В следующем уроке мы расскажем подробнее как разбираться с наиболее типичными ошибками, не вдаваясь глубоко в детали.

Поздравляем! В этом уроке вы установили Sublime и Ruby, создали папку для уроков `c:\rubytut` и написали первую самую простую программу `hello.rb`.

В следующем уроке мы напишем программу посложнее — «волшебный шар».
А также расскажем, зачем в коде программ нужны комментарии и отступы и научим находить и исправлять типичные ошибки в программах.
