

import 'dart:convert';

import 'package:voice_assistent/weather.dart';
import 'package:voice_assistent/weather_service.dart';

class AI{
  Future<String> getAnswer(String question) async {
    final RegExp weatherPattern = RegExp(r'погода в городе (.+)');
    final match = weatherPattern.firstMatch(question.trim());

    if (match != null) {
      final String city = match.group(1)!;
      try {
        final weekForecast = await _fetchWeatherData(city);
        String forecastString = "Прогноз на неделю:\n\n";
        for (int i = 0; i < weekForecast.length; i++) {
          String formattedDate = '${weekForecast[i].date.day}-${weekForecast[i]
              .date.month}-${weekForecast[i].date.year}';
          forecastString += "Дата: $formattedDate\n Температура: ${weekForecast[i]
              .temp}\n Облачность: ${weekForecast[i].description}\n\n ";
        }
        return forecastString;
      } catch (error) {
        return "Не удалось получить данные о погоде для города $city.";
      }
    } else if (question == "привет")
      return "Привет, дружище. Почему я здесь, верни обратно, пожалуйста.";
    return "Не понимаю...";
  }

  Future<List<Weather>> _fetchWeatherData(String city) async {
    final s = await WeatherService().getData(city);
    final data = json.decode(s);
    List<Weather> weekWeatherForecast = [];

    for (var i = 0; i < data['list'].length; i += 8) {
      var dayData = data['list'][i];
      var tempMin = dayData['main']['temp'].toString();
      var description = dayData['weather'][0]['description'];
      var date = DateTime.fromMillisecondsSinceEpoch(dayData['dt'] * 1000);
      weekWeatherForecast.add(Weather(tempMin, description, date));
    }
    return weekWeatherForecast;
  }
}