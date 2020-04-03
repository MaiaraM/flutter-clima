import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '55198ea35636b45b0cb8f40028973448';
const String urlBase =
    'http://api.openweathermap.org/data/2.5/weather?appid=$apiKey&units=metric';

class WeatherModel {
  Future getWeatherByCityName(cityName) async {
    NetworkHelper networkHelper = NetworkHelper("$urlBase&q=$cityName");
    return await networkHelper.getData();
  }

  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        "$urlBase&lat=${location.latitude}&lon=${location.longitude}");
    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
