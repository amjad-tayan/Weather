import 'package:flutter/material.dart';
import 'package:weather/variables.dart';
import 'package:weather/services/widget.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/screens/search.dart';

Weather weather = Weather();

class Home extends StatefulWidget {
  Home({this.weatherData, this.ForCastData});
  final weatherData;
  final ForCastData;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    setState(() {
      weather.GET_TodayTomorrowData(widget.ForCastData);
      weather.GET_thirdDay(widget.ForCastData);
      weather.GET_FourthDay(widget.ForCastData);
      weather.GET_FifthDay(widget.ForCastData);
      UpdateUI(widget.weatherData);
      weather.UpdateUIForCast(widget.ForCastData);
    });
  }

  UpdateUI(dynamic weatherData) {
    setState(() {
      weatherStatus = weatherData['weather'][0]['description'];
      humidity = weatherData['main']['humidity'];
      wind = weatherData['wind']['speed'];
      temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
    });
  }

  UpdateUIForCastCity(dynamic ForCastData) {
    for (int i = 0; i <= 8; i++) {
      if (i == 0) {
        setState(() {
          Hour_Now = ForCastData['list'][0]['dt_txt'];
          Hour_Now_temp = ForCastData['list'][0]['main']['temp'];
          Hour_Now_condition = ForCastData['list'][0]['weather'][0]['id'];
          DateTime dateTime = DateTime.parse(Hour_Now);
          clock_Hour_Now = DisplayHour.format(dateTime);
        });
      }
      if (i == 1) {
        setState(() {
          H_After_03_Hour = ForCastData['list'][1]['dt_txt'];
          H_After_03_temp = ForCastData['list'][1]['main']['temp'];
          H_After_03_condition = ForCastData['list'][1]['weather'][0]['id'];
          DateTime dateTime = DateTime.parse(H_After_03_Hour);
          clock_H_After_03 = DisplayHour.format(dateTime);
        });
      }
      if (i == 2) {
        setState(() {
          H_After_06_Hour = ForCastData['list'][2]['dt_txt'];
          H_After_06_temp = ForCastData['list'][2]['main']['temp'];
          H_After_06_condition = ForCastData['list'][2]['weather'][0]['id'];
          DateTime dateTime = DateTime.parse(H_After_06_Hour);
          clock_H_After_06 = DisplayHour.format(dateTime);
        });
      }
      if (i == 3) {
        setState(() {
          H_After_09_Hour = ForCastData['list'][3]['dt_txt'];
          H_After_09_temp = ForCastData['list'][3]['main']['temp'];
          H_After_09_condition = ForCastData['list'][3]['weather'][0]['id'];
          DateTime dateTime = DateTime.parse(H_After_09_Hour);
          clock_H_After_09 = DisplayHour.format(dateTime);
        });
      }
      if (i == 4) {
        setState(() {
          H_After_12_Hour = ForCastData['list'][4]['dt_txt'];
          H_After_12_temp = ForCastData['list'][4]['main']['temp'];
          H_After_12_condition = ForCastData['list'][4]['weather'][0]['id'];
          DateTime dateTime = DateTime.parse(H_After_12_Hour);
          clock_H_After_12 = DisplayHour.format(dateTime);
        });
      }
      if (i == 5) {
        setState(() {
          H_After_15_Hour = ForCastData['list'][5]['dt_txt'];
          H_After_15_temp = ForCastData['list'][5]['main']['temp'];
          H_After_15_condition = ForCastData['list'][5]['weather'][0]['id'];
          DateTime dateTime = DateTime.parse(H_After_15_Hour);
          clock_H_After_15 = DisplayHour.format(dateTime);
        });
      }
      if (i == 6) {
        setState(() {
          H_After_18_Hour = ForCastData['list'][6]['dt_txt'];
          H_After_18_temp = ForCastData['list'][6]['main']['temp'];
          H_After_18_condition = ForCastData['list'][6]['weather'][0]['id'];
          DateTime dateTime = DateTime.parse(H_After_18_Hour);
          clock_H_After_18 = DisplayHour.format(dateTime);
        });
      }
      if (i == 7) {
        setState(() {
          H_After_21_Hour = ForCastData['list'][7]['dt_txt'];
          H_After_21_temp = ForCastData['list'][7]['main']['temp'];
          H_After_21_condition = ForCastData['list'][7]['weather'][0]['id'];
          DateTime dateTime = DateTime.parse(H_After_21_Hour);
          clock_H_After_21 = DisplayHour.format(dateTime);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: weather.ChangeBackground(condition, Hour_Now),
                  fit: BoxFit.cover),
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // City - GetLocation
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        cityName,
                        style: textStyle.copyWith(fontSize: 35),
                      ),
                    ),
                    GestureDetector(
                      child: Icon(Icons.location_on_outlined,
                          size: 40, color: Colors.white),
                      onTap: () {
                        setState(() {
                          weather.GET_TodayTomorrowData(widget.ForCastData);
                          weather.GET_thirdDay(widget.ForCastData);
                          weather.GET_FourthDay(widget.ForCastData);
                          weather.GET_FifthDay(widget.ForCastData);
                          UpdateUI(widget.weatherData);
                          weather.UpdateUIForCast(widget.ForCastData);
                        });
                      },
                    ),
                    Padding(padding: EdgeInsets.only(left: 3)),
                    GestureDetector(
                      child: Icon(Icons.search_rounded,
                          size: 40, color: Colors.white),
                      onTap: () async {
                        var CityName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Search(),
                          ),
                        );
                        if (CityName != null) {
                          var weatherCity =
                              await weather.GetWeatherByCity(CityName);
                          var CityForCastData =
                              await weather.GetForCastByCity(CityName);
                          await weather.GET_TodayTomorrowData(CityForCastData);
                          await weather.GET_thirdDay(CityForCastData);
                          await weather.GET_FourthDay(CityForCastData);
                          await weather.GET_FifthDay(CityForCastData);
                          await UpdateUI(weatherCity);
                          await UpdateUIForCastCity(CityForCastData);
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 65),

                //Result condition
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      //Result information Left side
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              '${temperature.toString()} ْ ',
                              style: textStyle.copyWith(fontSize: 85)
                            ),
                            Text(
                              weatherStatus,
                              style: textStyle.copyWith(fontSize: 33)
                            ),
                            // Text()
                          ],
                        ),
                      ),

                      //More information left side
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ConMoreDetails(
                                Icons: WeatherIcons.strong_wind,
                                Data: wind.toStringAsFixed(1)),
                            Padding(padding: EdgeInsets.only(bottom: 5)),
                            ConMoreDetails(
                              Icons: WeatherIcons.humidity,
                              Data: humidity.toString(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //Hourly ForeCast
                Expanded(
                    child: ConHourlyForeCast(title: 'HOURLY FORECAST'),
                    flex: 1),

                Padding(padding: EdgeInsets.only(bottom: 5)),

                //Daily ForeCast
                Expanded(
                    child: ConDailyForeCast(title: 'DAILY FORECAST'), flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
