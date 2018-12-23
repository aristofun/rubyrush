# Тест на класс КредитнаяЗаявка

# Как всегда, начинаем с подключения класса. Обратите внимание, что rspec сам
# догадается, откуда брать класс.
require 'credit_request'

describe CreditRequest do
  it 'assigns instance variables' do
    credit_request = CreditRequest.new(30, :male, 20_000, true, 10_000)
    expect(credit_request.age).to eq 30
    expect(credit_request.sex).to eq :male
    expect(credit_request.income).to eq 20_000
    expect(credit_request.history).to eq true
    expect(credit_request.amount).to eq 10_000
  end

  describe '#calculate_score!' do
    it 'updates score with 20' do
      credit_request = CreditRequest.new(30, :female, 10_000, false, 50_000)
      expect(credit_request.score).to eq 20
    end

    it 'updates score with 40' do
      credit_request = CreditRequest.new(30, :male, 40_000, false, 10_000)
      expect(credit_request.score).to eq 40
    end

    it 'updates score with 50' do
      credit_request = CreditRequest.new(30, :male, 20_000, true, 10_000)
      expect(credit_request.score).to eq 50
    end
  end

  describe '#approved?' do
    it 'returns true for score 50' do
      credit_request = CreditRequest.new(30, :male, 20_000, true, 10_000)
      expect(credit_request.approved?).to be_truthy
    end

    it 'returns false for score 20' do
      credit_request = CreditRequest.new(30, :female, 10_000, false, 50_000)
      expect(credit_request.approved?).to be_falsey
    end
  end
end
