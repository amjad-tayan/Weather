import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather/variables.dart';
import 'package:weather/services/weather.dart';

Weather weather = Weather();

class ConMoreDetails extends StatelessWidget {
  ConMoreDetails({required this.Icons, required this.Data});
  IconData Icons;
  String Data;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
          color: Colors.black38, borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 8)),
          BoxedIcon(Icons, color: Colors.white),
          Padding(padding: EdgeInsets.only(left: 5)),
          Text(Data, style: ConTextStyle),
        ],
      ),
    );
  }
}

class ConHourlyForeCast extends StatelessWidget {
  ConHourlyForeCast({required this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3),
          ),
          Text(
            title,
            style: ConTextStyle.copyWith(fontSize: 15),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2),
          ),
          Divider(
            color: Colors.white,
            height: 3,
            thickness: 1,
            endIndent: 70,
            indent: 70,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ConForeCastInformation(
                    Hour: 'Now',
                    HourCondition: Hour_Now,
                    condition: Hour_Now_condition,
                    Temp: '${temperature.toStringAsFixed(1)} ْ C'),
                ConForeCastInformation(
                    Hour: clock_H_After_03,
                    HourCondition: H_After_03_Hour,
                    condition: H_After_03_condition,
                    Temp: '${H_After_03_temp.toStringAsFixed(1)} ْ C'),
                ConForeCastInformation(
                    Hour: clock_H_After_06,
                    HourCondition: H_After_06_Hour,
                    condition: H_After_06_condition,
                    Temp: '${H_After_06_temp.toStringAsFixed(1)} ْ C'),
                ConForeCastInformation(
                    Hour: clock_H_After_09,
                    HourCondition: H_After_09_Hour,
                    condition: H_After_09_condition,
                    Temp: '${H_After_09_temp.toStringAsFixed(1)} ْ C'),
                ConForeCastInformation(
                    Hour: clock_H_After_12,
                    HourCondition: H_After_12_Hour,
                    condition: H_After_12_condition,
                    Temp: '${H_After_12_temp.toStringAsFixed(1)} ْ C'),
                ConForeCastInformation(
                    Hour: clock_H_After_15,
                    HourCondition: H_After_15_Hour,
                    condition: H_After_15_condition,
                    Temp: '${H_After_15_temp.toStringAsFixed(1)} ْ C'),
                ConForeCastInformation(
                    Hour: clock_H_After_18,
                    HourCondition: H_After_18_Hour,
                    condition: H_After_18_condition,
                    Temp: '${H_After_18_temp.toStringAsFixed(1)} ْ C'),
                ConForeCastInformation(
                    Hour: clock_H_After_21,
                    HourCondition: H_After_21_Hour,
                    condition: H_After_21_condition,
                    Temp: '${H_After_21_temp.toStringAsFixed(1)} ْ C'),
              ]))
        ],
      ),
    );
  }
}

class ConDailyForeCast extends StatelessWidget {
  ConDailyForeCast({required this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3),
          ),
          Text(
            title,
            style: ConTextStyle.copyWith(fontSize: 15)
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2),
          ),
          Divider(
            color: Colors.white,
            height: 3.0,
            thickness: 1.0,
            endIndent: 70.0,
            indent: 70.0,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ConForeCastInformation(
                    Hour: 'Today',
                    HourCondition: Hour_Now,
                    condition: Hour_Now_condition,
                    Temp: '${temperature.toStringAsFixed(1)} ْ C'),
                ConForeCastInformation(
                    Hour: Tomorrow,
                    HourCondition: Tomorrow_Hour_12,
                    condition: Tomorrow_condition,
                    Temp: '${Tomorrow_temp.toStringAsFixed(1)} ْ C'),
                ConForeCastInformation(
                    Hour: ThirdDay,
                    HourCondition: ThirdDay_Hour_12,
                    condition: ThirdDay_condition,
                    Temp: '${ThirdDay_temp.toStringAsFixed(1)} ْ C'),
                ConForeCastInformation(
                    Hour: FourthDay,
                    HourCondition: FourthDay_Hour_12,
                    condition: FourthDay_condition,
                    Temp: '${FourthDay_temp.toStringAsFixed(1)} ْ C'),
                ConForeCastInformation(
                    Hour: FifthDay,
                    HourCondition: FifthDay_Hour_12,
                    condition: FifthDay_condition,
                    Temp: '${FifthDay_temp.toStringAsFixed(1)} ْ C'),
              ]))
        ],
      ),
    );
  }
}

class ConForeCastInformation extends StatelessWidget {
  ConForeCastInformation(
      {required this.Hour,
      required this.HourCondition,
      required this.condition,
      required this.Temp});
  final Hour;
  final HourCondition;
  final condition;
  final String Temp;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Text(
            Hour,
            style: ConTextStyle.copyWith(fontSize: 17),
          ),
          Padding(padding: EdgeInsets.only(bottom: 1)),
          BoxedIcon(weather.GetWeatherIcon(condition, HourCondition),
              color: Colors.white,size: 17),
          Text(
            Temp,
            style:  ConTextStyle.copyWith(fontSize: 17),
          ),
        ],
      ),
    );
  }
}

class SUGGESTED_CITIES extends StatelessWidget {
  SUGGESTED_CITIES({required this.CityName,required this.OnTap});
  final CityName;
  final VoidCallback  OnTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(onTap:OnTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              CityName,
              style: ByttomtextStyle.copyWith(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
