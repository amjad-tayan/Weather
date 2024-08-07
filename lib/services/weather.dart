import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networkApi.dart';
import 'package:weather/variables.dart';
import 'package:weather_icons/weather_icons.dart';

Location location = Location();

class Weather {
  Future<dynamic> GetWeatherByLocation() async {
    await location.GetLocation();
    NetworkHelper networkHelper = NetworkHelper(
        URL:
            '$Url?lat=${location.latitude}&lon=${location.longitude}&appid=$ApiKEY&units=metric');
    var WeatherData = await networkHelper.getData();
    return WeatherData;
  }

  Future<dynamic> GetForCastWeather() async {
    await location.GetLocation();
    NetworkHelper networkHelper = NetworkHelper(
        URL:
            '$ForCast?lat=${location.latitude}&lon=${location.longitude}&appid=$ApiKEY&units=metric');
    var ForCastData = await networkHelper.getData();
    // print(ForCastData);
    return ForCastData;
  }

  Future<dynamic> GetWeatherByCity(String CityName) async {
    NetworkHelper networkHelper =
        NetworkHelper(URL: '$Url?q=${CityName}&appid=$ApiKEY&units=metric');
    var WeatherData = await networkHelper.getData();
    return WeatherData;
  }

  Future<dynamic> GetForCastByCity(String CityName) async {
    NetworkHelper networkHelper =
        NetworkHelper(URL: '$ForCast?q=${CityName}&appid=$ApiKEY&units=metric');
    var ForCastData = await networkHelper.getData();
    return ForCastData;
  }

  UpdateUIForCast(dynamic ForCastData) {
    for (int i = 0; i <= 8; i++) {
      if (i == 0) {
        Hour_Now = ForCastData['list'][0]['dt_txt'];
        Hour_Now_temp = ForCastData['list'][0]['main']['temp'];
        Hour_Now_condition = ForCastData['list'][0]['weather'][0]['id'];
        DateTime dateTime = DateTime.parse(Hour_Now);
        clock_Hour_Now = DisplayHour.format(dateTime);
      }
      if (i == 1) {
        H_After_03_Hour = ForCastData['list'][1]['dt_txt'];
        H_After_03_temp = ForCastData['list'][1]['main']['temp'];
        H_After_03_condition = ForCastData['list'][1]['weather'][0]['id'];
        DateTime dateTime = DateTime.parse(H_After_03_Hour);
        clock_H_After_03 = DisplayHour.format(dateTime);
      }
      if (i == 2) {
        H_After_06_Hour = ForCastData['list'][2]['dt_txt'];
        H_After_06_temp = ForCastData['list'][2]['main']['temp'];
        H_After_06_condition = ForCastData['list'][2]['weather'][0]['id'];
        DateTime dateTime = DateTime.parse(H_After_06_Hour);
        clock_H_After_06 = DisplayHour.format(dateTime);
      }
      if (i == 3) {
        H_After_09_Hour = ForCastData['list'][3]['dt_txt'];
        H_After_09_temp = ForCastData['list'][3]['main']['temp'];
        H_After_09_condition = ForCastData['list'][3]['weather'][0]['id'];
        DateTime dateTime = DateTime.parse(H_After_09_Hour);
        clock_H_After_09 = DisplayHour.format(dateTime);
      }
      if (i == 4) {
        H_After_12_Hour = ForCastData['list'][4]['dt_txt'];
        H_After_12_temp = ForCastData['list'][4]['main']['temp'];
        H_After_12_condition = ForCastData['list'][4]['weather'][0]['id'];
        DateTime dateTime = DateTime.parse(H_After_12_Hour);
        clock_H_After_12 = DisplayHour.format(dateTime);
      }
      if (i == 5) {
        H_After_15_Hour = ForCastData['list'][5]['dt_txt'];
        H_After_15_temp = ForCastData['list'][5]['main']['temp'];
        H_After_15_condition = ForCastData['list'][5]['weather'][0]['id'];
        DateTime dateTime = DateTime.parse(H_After_15_Hour);
        clock_H_After_15 = DisplayHour.format(dateTime);
      }
      if (i == 6) {
        H_After_18_Hour = ForCastData['list'][6]['dt_txt'];
        H_After_18_temp = ForCastData['list'][6]['main']['temp'];
        H_After_18_condition = ForCastData['list'][6]['weather'][0]['id'];
        DateTime dateTime = DateTime.parse(H_After_18_Hour);
        clock_H_After_18 = DisplayHour.format(dateTime);
      }
      if (i == 7) {
        H_After_21_Hour = ForCastData['list'][7]['dt_txt'];
        H_After_21_temp = ForCastData['list'][7]['main']['temp'];
        H_After_21_condition = ForCastData['list'][7]['weather'][0]['id'];
        DateTime dateTime = DateTime.parse(H_After_21_Hour);
        clock_H_After_21 = DisplayHour.format(dateTime);
      }
    }
  }

  GET_TodayTomorrowData(dynamic ForCastData) {
    int i = 0;
    var listdt_txt = ForCastData['list'][0]['dt_txt'];
    DateTime dateTime = DateTime.parse(listdt_txt);
    Today = Day.format(dateTime);
    for (i = 1; i < 40; i++) {
      var listdt_txt_n = ForCastData['list'][i]['dt_txt'];
      DateTime dateTime = DateTime.parse(listdt_txt_n);
      var nextday = Day.format(dateTime);
      var weatherhour12 = DisplayHour.format(dateTime);
      if (nextday != Today) {
        Tomorrow = nextday;
        if (weatherhour12 == '12:00') {
          Tomorrow_Hour_12 = ForCastData['list'][i]['dt_txt'];
          Tomorrow_temp = ForCastData['list'][i]['main']['temp'];
          Tomorrow_condition = ForCastData['list'][i]['weather'][0]['id'];
          break;
        }
      }
    }
  }

  GET_thirdDay(dynamic ForCastData) {
    int i = 0;
    for (i = 1; i < 40; i++) {
      var list = ForCastData['list'][i]['dt_txt'];
      DateTime dateTime = DateTime.parse(list);
      var nextday = Day.format(dateTime);
      var weatherhour12 = DisplayHour.format(dateTime);
      if (nextday != Today && nextday != Tomorrow) {
        ThirdDay = nextday;
        if (weatherhour12 == '12:00') {
          ThirdDay_Hour_12 = ForCastData['list'][i]['dt_txt'];
          ThirdDay_temp = ForCastData['list'][i]['main']['temp'];
          ThirdDay_condition = ForCastData['list'][i]['weather'][0]['id'];
          break;
        }
      }
    }
  }

  GET_FourthDay(dynamic ForCastData) {
    int i = 0;
    for (i = 1; i < 40; i++) {
      var list = ForCastData['list'][i]['dt_txt'];
      DateTime dateTime = DateTime.parse(list);
      var weatherhour12 = DisplayHour.format(dateTime);
      var nextday = Day.format(dateTime);
      if (nextday != Today && nextday != Tomorrow && nextday != ThirdDay) {
        FourthDay = nextday;
        if (weatherhour12 == '12:00') {
          FourthDay_Hour_12 = ForCastData['list'][i]['dt_txt'];
          FourthDay_temp = ForCastData['list'][i]['main']['temp'];
          FourthDay_condition = ForCastData['list'][i]['weather'][0]['id'];
          break;
        }
      }
    }
  }

  GET_FifthDay(dynamic ForCastData) {
    int i = 0;
    for (i = 1; i < 40; i++) {
      var list = ForCastData['list'][i]['dt_txt'];
      DateTime dateTime = DateTime.parse(list);
      var nextday = Day.format(dateTime);
      var weatherhour12 = DisplayHour.format(dateTime);
      if (nextday != Today &&
          nextday != Tomorrow &&
          nextday != ThirdDay &&
          nextday != FourthDay) {
        FifthDay = nextday;
        if (weatherhour12 == '12:00') {
          FifthDay_Hour_12 = ForCastData['list'][i]['dt_txt'];
          FifthDay_temp = ForCastData['list'][i]['main']['temp'];
          FifthDay_condition = ForCastData['list'][i]['weather'][0]['id'];
          break;
        }
      }
    }
  }

  GetWeatherIcon(int condition, dynamic hour) {
    DateTime dateTime = DateTime.parse(hour);
    if (dateTime.hour == 6 ||
        dateTime.hour == 9 ||
        dateTime.hour == 12 ||
        dateTime.hour == 15) {
      if (condition <= 209) {
        return WeatherIcons.day_thunderstorm;
      } else if (condition < 230) {
        return WeatherIcons.day_lightning;
      } else if (condition < 300) {
        return WeatherIcons.day_thunderstorm;
      } else if (condition < 302) {
        return WeatherIcons.day_sprinkle;
      } else if (condition < 321) {
        return WeatherIcons.day_rain;
      } else if (condition < 500) {
        return WeatherIcons.day_sprinkle;
      } else if (condition < 511) {
        return WeatherIcons.day_rain;
      } else if (condition < 520) {
        return WeatherIcons.day_rain_mix;
      } else if (condition < 531) {
        return WeatherIcons.day_showers;
      } else if (condition == 600) {
        return WeatherIcons.day_snow;
      } else if (condition == 601) {
        return WeatherIcons.day_sleet;
      } else if (condition == 602) {
        return WeatherIcons.day_snow;
      } else if (condition < 611) {
        return WeatherIcons.day_rain_mix;
      } else if (condition < 620) {
        return WeatherIcons.day_snow;
      } else if (condition < 701) {
        return WeatherIcons.day_showers;
      } else if (condition < 711) {
        return WeatherIcons.smoke;
      } else if (condition < 721) {
        return WeatherIcons.day_haze;
      } else if (condition < 731) {
        return WeatherIcons.dust;
      } else if (condition < 741) {
        return WeatherIcons.day_fog;
      } else if (condition < 761) {
        return WeatherIcons.dust;
      } else if (condition < 781) {
        return WeatherIcons.tornado;
      } else if (condition == 800) {
        return WeatherIcons.day_sunny;
      } else if (condition < 804) {
        return WeatherIcons.day_cloudy_gusts;
      } else if (condition < 900) {
        return WeatherIcons.day_sunny_overcast;
      } else if (condition <= 901) {
        return WeatherIcons.tornado;
      } else if (condition == 902) {
        return WeatherIcons.hurricane;
      } else if (condition == 903) {
        return WeatherIcons.snowflake_cold;
      } else if (condition < 906) {
        return WeatherIcons.hot;
      } else if (condition < 956) {
        return WeatherIcons.day_hail;
      } else if (condition >= 957) {
        return WeatherIcons.strong_wind;
      }
    } else if (dateTime.hour == 18 ||
        dateTime.hour == 21 ||
        dateTime.hour == 0 ||
        dateTime.hour == 3) {
      if (condition <= 209) {
        return WeatherIcons.night_alt_thunderstorm;
      } else if (condition < 230) {
        return WeatherIcons.night_alt_lightning;
      } else if (condition < 300) {
        return WeatherIcons.night_alt_thunderstorm;
      } else if (condition < 302) {
        return WeatherIcons.night_alt_sprinkle;
      } else if (condition < 321) {
        return WeatherIcons.night_alt_rain;
      } else if (condition < 500) {
        return WeatherIcons.night_alt_sprinkle;
      } else if (condition < 511) {
        return WeatherIcons.night_alt_rain;
      } else if (condition < 520) {
        return WeatherIcons.night_alt_rain_mix;
      } else if (condition < 531) {
        return WeatherIcons.night_alt_showers;
      } else if (condition == 600) {
        return WeatherIcons.night_alt_snow;
      } else if (condition == 601) {
        return WeatherIcons.night_alt_sleet;
      } else if (condition == 602) {
        return WeatherIcons.night_alt_snow;
      } else if (condition < 611) {
        return WeatherIcons.night_alt_rain_mix;
      } else if (condition < 620) {
        return WeatherIcons.night_alt_snow;
      } else if (condition < 701) {
        return WeatherIcons.night_alt_showers;
      } else if (condition < 711) {
        return WeatherIcons.smoke;
      } else if (condition < 721) {
        return WeatherIcons.day_haze;
      } else if (condition < 731) {
        return WeatherIcons.dust;
      } else if (condition < 741) {
        return WeatherIcons.day_fog;
      } else if (condition < 761) {
        return WeatherIcons.dust;
      } else if (condition < 781) {
        return WeatherIcons.tornado;
      } else if (condition == 800) {
        return WeatherIcons.night_clear;
      } else if (condition < 804) {
        return WeatherIcons.night_alt_cloudy_gusts;
      } else if (condition < 900) {
        return WeatherIcons.night_alt_cloudy;
      } else if (condition <= 901) {
        return WeatherIcons.tornado;
      } else if (condition == 902) {
        return WeatherIcons.hurricane;
      } else if (condition == 903) {
        return WeatherIcons.snowflake_cold;
      } else if (condition < 906) {
        return WeatherIcons.hot;
      } else if (condition < 956) {
        return WeatherIcons.night_alt_hail;
      } else if (condition >= 957) {
        return WeatherIcons.strong_wind;
      }
    }
  }

  ChangeBackground(int condition, dynamic hour) {
    DateTime dateTime = DateTime.parse(hour);
    if (dateTime.hour == 6 ||
        dateTime.hour == 9 ||
        dateTime.hour == 12 ||
        dateTime.hour == 15) {
      if (condition < 300) {
        return AssetImage('images/Thunderstorm-Day.jpg');
      } else if (condition < 600) {
        return AssetImage('images/Rainy_Day.jpg');
      } else if (condition < 700) {
        return AssetImage('images/Snow_Day.jpg');
      } else if (condition < 800) {
        return AssetImage('images/Mist.jpg');
      }else if (condition == 800) {
        return AssetImage('images/Clear_Day.jpg');
      }else if (condition == 801) {
        return AssetImage('images/few_clouds_Day.jpg');
      }else if (condition == 802||condition == 803) {
        return AssetImage('images/broken_clouds_Day.jpg');
      }else if (condition <900) {
        return AssetImage('images/Clouds_Day.jpg');
      }else if (condition >=900) {
        return AssetImage('images/tornado.jpg');
      }

    } else if (dateTime.hour == 18 ||
        dateTime.hour == 21 ||
        dateTime.hour == 0 ||
        dateTime.hour == 3) {
      if (condition < 300) {
        return AssetImage('images/Thunderstorm-Night.jpg');
      } else if (condition < 600) {
        return AssetImage('images/Rainy_Night.jpg');
      } else if (condition < 700) {
        return AssetImage('images/Snow_Night.jpg');
      } else if (condition < 800) {
        return AssetImage('images/Mist.jpg');
      }else if (condition == 800) {
        return AssetImage('images/Clear_Night.jpg');
      }else if (condition == 801) {
        return AssetImage('images/few_clouds_Night.jpg');
      }else if (condition == 802||condition == 803) {
        return AssetImage('images/broken_clouds_Night.jpg');
      }else if (condition <900) {
        return AssetImage('images/Clouds_Night.jpg');
      }else if (condition >=900) {
        return AssetImage('images/tornado.jpg');
      }
    }
  }
}
