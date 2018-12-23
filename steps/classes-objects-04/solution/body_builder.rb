# Объявим класс BodyBuilder. В представлении он не нуждается, я надеюсь.
class BodyBuilder
  # В конструкторе создаем три группы мышц
  def initialize
    @triceps = 0
    @biceps = 0
    @deltovidka = 0
  end

  # Увеличиваем мышцы в зависимости типа мышцы (параметр muscle, который
  # передали в этот метод в качестве аргумента)
  def pump(muscle)
    # Используем для этого конструкцию case
    case muscle
    when 'triceps'
      @triceps += 1
    when 'biceps'
      @biceps += 1
    when 'deltovidka'
      @deltovidka += 1
    end
  end

  # Метод show_muscles выводит на экран текущий статус мышц
  def show_muscles
    puts "Бицепсы: #{@biceps}"
    puts "Трицепсы: #{@triceps}"
    puts "Дельтовидка: #{@deltovidka}"
  end
end
