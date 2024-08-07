import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:weather/screens/home.dart';
import 'dart:io';
import 'package:weather/variables.dart';

class getstart extends StatefulWidget {
  @override
  State<getstart> createState() => _getstartState();
}

class _getstartState extends State<getstart> {
  var weatherData;
  var ForCastData;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Container(
              color: Colors.white,
              child: GestureDetector(
                onTap: () async {
                  weatherData = await weather.GetWeatherByLocation();
                  ForCastData = await weather.GetForCastWeather();
                  if (weatherData != null && ForCastData != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(
                              weatherData: weatherData,
                              ForCastData: ForCastData),
                        ));
                  } else {
                    Alert(
                      context: context,
                      type: AlertType.warning,
                      title: "Location services Down",
                      style: AlertStyle(titleStyle: ByttomtextStyle),
                      desc: "Please check location services permissions.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Exit",
                            style: AlertButtextStyle,
                          ),
                          onPressed: () {
                            exit(0);
                          },
                          color: Colors.redAccent,
                        ),
                        DialogButton(
                          child: Text(
                            "Location",
                            style: AlertButtextStyle,
                          ),
                          onPressed: () async {
                            await Geolocator.requestPermission();
                            bool serviceEnabled;
                            serviceEnabled =
                                await Geolocator.isLocationServiceEnabled();
                            if (!serviceEnabled) {
                              await Geolocator.openLocationSettings();
                            }
                          },
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(116, 116, 191, 1.0),
                            Color.fromRGBO(52, 138, 199, 1.0)
                          ]),
                        )
                      ],
                    ).show();
                  }
                },
                child: Container(
                    height: 75,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child:
                        Center(child: Text('Get Start ...', style: textStyle))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
