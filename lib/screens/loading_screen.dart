import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

const apiKLey = '2746713a2aece249c0dbc4ff31e62ef6';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  initState() {
    super.initState();
    getLocationData();
  }

  // void deactivate() {     //call when widghet is finish
  //   super.deactivate();"https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKLey"yy

  // }

  getLocationData() async {
    var decodeData = await WeatherModel().getLocationWather();
    var id = decodeData['weather'][0]['id'];
    var temp = decodeData['main']['temp'];
    var city = decodeData['name'];
    // print(longitude);
    print(id);
    print(temp);
    print(city);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(LocationWeather: decodeData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    print("2222");
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
