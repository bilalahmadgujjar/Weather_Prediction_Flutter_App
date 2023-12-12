// WeatherService.dart

import 'location.dart';
import 'package:clima/Networking.dart';

class WeatherService {
  final apiKey = 'b450a083735f197bd22673bc3536be42';

  Future<dynamic> getlocationData() async {
    try {
      Location obj = new Location();
      await obj.getlocation();

      double? latitude = obj.latitude;
      double? longitude = obj.longitude;

      NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

      return await networkHelper.getData();
    } catch (e) {
      print("Error in getlocationData: $e");
      return null;
    }
  }
}
