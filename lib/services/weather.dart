import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKLey = '2746713a2aece249c0dbc4ff31e62ef6';
const url = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkingHelper networkingHelper = NetworkingHelper(
        Url:
            "$url?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKLey&units=metric");
    var decodeData = await networkingHelper.getData();

    return decodeData;
  }

  Future<dynamic> getCityNameWather(selectedCity) async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkingHelper networkingHelper = NetworkingHelper(
        Url: "$url?q=$selectedCity&appid=$apiKLey&units=metric");
    var decodeData = await networkingHelper.getData();

    return decodeData;
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
