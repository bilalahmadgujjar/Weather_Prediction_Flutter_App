import 'package:clima/Networking.dart';

const apiKey = 'b450a083735f197bd22673bc3536be42';
//https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
const openweathermapurl = 'https://api.openweathermap.org/data/2.5/weather';

//
 class WeatherModel {

   Future<dynamic> getCityWeather(String cityname) async {
     var encodedCityName = Uri.encodeComponent(cityname);
     var url = '$openweathermapurl?q=$encodedCityName&appid=$apiKey&units=metric';
     NetworkHelper networkHelper = NetworkHelper(url);

     try {
       dynamic weatherData = await networkHelper.getData();
       return weatherData;
     } catch (e) {
       print(e);
       return null;
     }
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
