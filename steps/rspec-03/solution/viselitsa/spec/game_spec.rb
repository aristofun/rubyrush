# encoding: utf-8
#
# Подключим класс Game, который хотим тестировать
require 'game'

describe 'Game' do
  # Напишем два теста:
  #
  # * игрa с успешным результатом
  # * игрa с проигрышем
  #
  # Чтобы протестировать какую-то сложную ситуацию, нам нужно сделать сразу
  # несколько действий с нашим классом. В нашем случае, мы загадаем слово и
  # сделаем несколько правильных ходов с помощью метода next_step.

  # Тест на случай игры, где игрок выигрывает без единой ошибки
  it 'user wins the game' do
    # Загадываем слово
    game = Game.new('слово')

    # Убедимся, что в начале игры статус — игра в процессе
    expect(game.status).to eq :in_progress

    # Удачно отгадаем несколько букв, симулируя действия игрока
    game.next_step 'с'
    game.next_step 'о'
    game.next_step 'в'
    game.next_step 'л'

    # Теперь изучем состояние экземпляра game: количество ошибок и статус
    expect(game.errors).to eq 0
    expect(game.status).to eq :won
  end

  # Тест на случай игры, где игрок проигрывает
  it 'user loses the game' do
    # Снова загадаем слово, для интереса — другое
    game = Game.new('астма')

    # На этот раз попытки пользователя будут не столь успешные
    game.next_step 'г'
    game.next_step 'р'
    game.next_step 'п'
    game.next_step 'у'
    game.next_step 'т'
    game.next_step 'о'
    game.next_step 'х'
    game.next_step 'н'

    # И снова проверим состояние игры: у нас 7 ошибок и игра проиграна
    expect(game.errors).to eq 7
    expect(game.status).to eq :lost
  end
end
