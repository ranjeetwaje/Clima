import '../utilities/constants.dart';
import 'location.dart';
import 'networking.dart';

class WeatherModel {

  Future<dynamic> getCurrentLocationWeatherData() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    String url = kBaseUrl + 'weather?lat=${loc.latitude}&lon=${loc
        .longitude}&appid=$kApiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getWeatherData();

    return weatherData;
  }

  Future<dynamic> getCityWeatherData(String cityName) async {
    String url = kBaseUrl + 'weather?q=$cityName&appid=$kApiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getWeatherData();
    print(weatherData);
    return weatherData;
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
