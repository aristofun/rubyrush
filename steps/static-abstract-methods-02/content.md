# Магазин с сеттерами и update 

Продолжаем развивать наш «Магазин»: допишите важные методы для изменения экземпляров классов Book и Film.

Сделайте так, чтобы у любого продукта можно было поменять внутреннюю переменную экземпляра, например, вот так:

```ruby
product = Film.new(title: 'Леон', director: 'Люк Бессон', price: 990)

product.year = 1994
product.amount = 5
```

или так:

```ruby
product.update(year: 1994, amount: 5)
```

<div class="rubyrush-task-hint">

Сеттер для экземпляра класса можно сделать несколькими способами, например, так:

```ruby
def name=(name)
  @name = name
end
```

Для этой же записи можно использовать `attr_writer` или `attr_accessor`:

```ruby
class Person
  attr_writer :name
end
```

Тогда в программе можно будет написать:

```ruby
person = Person.new
person.name = 'Василий'
```

Обратите внимание, что если `puts` передать объект в качестве параметра, то он сам вызовет у него метод `to_s`.

</div>


<div class="rubyrush-task-answer">


<ul>
<li><a href="https://github.com/aristofun/rubyrush-path/blob/master/steps/static-abstract-methods-02/solution/02_store.zip" class="rubyrush-task-solution-link">Наше решение</a></li></ul>


</div>
