import 'package:clima/constants.dart';
import 'package:clima/weather.dart';
import 'package:flutter/material.dart';
import 'Loading_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'city_screen.dart';
import 'package:clima/weather_service.dart';



class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final VideoPlayerController videoPlayerController =
  VideoPlayerController.asset('video/bg1.mp4');
  ChewieController? chewieController;

  int? temperature;
  int? condition;
  String? cityName;
  String? valuecondition;
  String? valutemp;

  WeatherModel wobj = new WeatherModel();
  LoadingScreenState loadobj = new LoadingScreenState();
  WeatherModel weatherobj = new WeatherModel();
  WeatherService weatherService = new WeatherService();
 // WeatherService weatherService = WeatherService();






  @override
  void initState() {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 9 / 20,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      showControls: false,
    );
    super.initState();

    // widgets passes data to the update function
    updateUI(
        widget.locationWeather); // it access only in the screen widgets class
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  void updateUI(dynamic weatherrecord) {

    if(weatherrecord == null)
    {
      temperature =0;
      valuecondition = 'Error';
      valutemp = 'Unable to get weather data ';
      cityName = '';
      return;
    }
    //temperature = weatherrecord['main']['temp']; // Fixed the access here
    temperature = (weatherrecord['main']['temp'] as double).toInt();
    valutemp = wobj.getMessage(temperature!) as String?;
    condition = weatherrecord['weather'][0]['id'];
    valuecondition = wobj.getWeatherIcon(condition!) as String;
    cityName = weatherrecord['name']; // Fixed the access here
    print(temperature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const NetworkImage(
                  'https://images.unsplash.com/photo-1527482797697-8795b05a13fe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHdlYXRoZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop)),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextButton(

                          onPressed: () async {
                            dynamic weatherdata = await weatherService.getlocationData();
                            setState(() {
                              updateUI(weatherdata);
                            });
                          },


                          //
                          // onPressed: () async {
                          //   dynamic weatherdata = await loadobj.getlocationData();
                          //   print(weatherdata);
                          //
                          //   setState(() {
                          //     updateUI(weatherdata);
                          //   });
                          //
                          // },


                          // onPressed: () async {
                          //   try {
                          //     dynamic weatherdata = await loadobj.getlocationData();
                          //     if(weatherdata != null) {
                          //       setState(() {
                          //         updateUI(weatherdata);
                          //       });
                          //     } else {
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //         SnackBar(content: Text('Failed to get weather data for current location')),
                          //       );
                          //     }
                          //   } catch(e) {
                          //     print(e);
                          //     ScaffoldMessenger.of(context).showSnackBar(
                          //       SnackBar(content: Text('An error occurred: $e')),
                          //     );
                          //   }
                          // },

                          child: const Icon(
                            Icons.near_me,
                            color: Colors.white,
                            size: 50.0,
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: TextButton(
                        onPressed: () async {
                          var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return Cityscreen();
                          }));

                          if(typedName != null) {
                            try {
                              var weatherData = await weatherobj.getCityWeather(typedName);
                              if(weatherData != null) {
                                setState(() {
                                  updateUI(weatherData);
                                });
                              } else {
                                // Handle the error gracefully, maybe show a snackbar or a dialog.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Failed to get weather data for $typedName')),
                                );
                              }
                            } catch(e) {
                              print(e);
                              // Handle the error gracefully, maybe show a snackbar or a dialog.
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('An error occurred: $e')),
                              );
                            }
                          }
                        },


                        child: const Icon(
                            Icons.location_city,
                            color: Colors.white,
                            size: 50.0,
                          ))),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      // Text('32', style: kTempTextStyle,),
                      Text(
                        '$temperature',
                        style: kTempTextStyle,
                      ),

                      Text(
                        '$valuecondition',
                        style: kConditionTextStyle,
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  '$valutemp at $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// Future<void> fetchLoction() async {
//
//   var weatherData = await
//   int condition = data['weather'][0]['id'];
//   double temperature = data['main']['temp']; // Fixed the access here
//   String cityName = data['name']; // Fixed the access here
//
//   // print(condition);
//   // print(temperature);
//   // print(cityName);
// }
// }
