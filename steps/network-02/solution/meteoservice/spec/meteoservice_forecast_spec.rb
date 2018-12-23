require 'meteoservice_forecast'

describe MeteoserviceForecast do
  describe '#to_s' do
    let(:forecast) do
      MeteoserviceForecast.new(
        date: Date.parse('30.03.2017'),
        time_of_day: 'утро',
        temperature_min: 10,
        temperature_max: 13,
        cloudiness: 'ясно',
        max_wind: 10
      )
    end

    it 'displays temperature range' do
      expect(forecast.to_s).to include('+10..+13')
    end

    it 'displays date' do
      expect(forecast.to_s).to include('30.03.2017')
    end

    it 'displays cloudiness' do
      expect(forecast.to_s).to include('ясно')
    end

    it 'displays wind speed' do
      expect(forecast.to_s).to include('ветер 10 м/с')
    end
  end
end
