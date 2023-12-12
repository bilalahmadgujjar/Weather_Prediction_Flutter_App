
import 'package:chewie/chewie.dart';
import 'package:clima/location.dart';
import 'package:flutter/material.dart';
import 'Networking.dart';
import 'Location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';


const apiKey = 'b450a083735f197bd22673bc3536be42';
const spinkit = SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
);


class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  VideoPlayerController? _controller;
  double? longitude;
  double? latitude;



  @override
  void initState() {
    super.initState();
    getlocationData();

  }




  Future<dynamic> getlocationData() async {
    try {
      Location obj = new Location();
      await obj.getlocation();

      latitude = obj.latitude;
      longitude = obj.longitude;

      NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

      dynamic weatherData = await networkHelper.getData(); // Assuming fetchData is a method in NetworkHelper


      Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen( locationWeather: weatherData  ))); // location weather is map<>

      return weatherData;
    }

    catch (e)
    {
      print("Error in getlocationData: $e");
    }

  }

//
// // fetch location is function name ( its return future void )
// Future<void> fetchLoction() async {
//   final response = await http
//       .get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=32.17&lon=74.3974&appid=b450a083735f197bd22673bc3536be42'));
//
//   if (response.statusCode == 200) {
//     String data = response.body;
//
//     // var longitude = jsonDecode(data)['coord']['lon'];
//     // print(longitude);
//     //
//     //
//     // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
//
//
//     var weatherd = jsonDecode(data)['weather'][0]['id'];
//     var maind= jsonDecode(data)['main'][0]['temp'];
//     var system= jsonDecode(data)['sys'][0]['type'];
//     print(weatherd);
//     print(maind);
//     print(system);
//
//   }
//
//   else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load location information ');
//   }
//
//
// }

  // FUNCTION WITHOUT VOID
  // getlocation() async {
  //
  //    // we use execption if any error occure that easily handle it.
  //    try {
  //      Position position = await Geolocator.getCurrentPosition(
  //          desiredAccuracy: LocationAccuracy.high);
  //      print(position);
  //    }
  //    catch(e)
  //    {
  //      print(e);
  //    }
  //
  //  }
  // void somethingThatExpectsLessThan10 (int n)
  // {
  //   if(n>10)
  //     {
  //       throw 'n is greater than 10 n should always be less than 10';
  //     }
  // }
  //
  //
  // This is widget full states
  // @override
  // void deactivated()
  // {
  //   super.deactivate();
  //   print('Location now deactivated');
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[


          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SpinKitDoubleBounce(
                  color: Colors.white,
                  size: 100.0,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }


}