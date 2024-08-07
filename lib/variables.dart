import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const ApiKEY = '8c2aedfbb0e5f5c2b782954dace815f5';
const Url = 'https://api.openweathermap.org/data/2.5/weather';
const ForCast = 'https://api.openweathermap.org/data/2.5/forecast';

// Result
dynamic weatherStatus;
dynamic weatherBackground;
int humidity=0;
double wind = 0;
dynamic temp;
dynamic temperature;
dynamic condition;
dynamic cityName;

// ForHourlyCastData
final DisplayHour = DateFormat('HH:mm');

var Hour_Now;
var clock_Hour_Now;
var Hour_Now_temp ;
var Hour_Now_temperature = Hour_Now_temp.toInt();
var Hour_Now_condition;

var H_After_03_Hour;
var clock_H_After_03;
var H_After_03_temp ;
var H_After_03_temperature = H_After_03_temp.toInt();
var H_After_03_condition;

var H_After_06_Hour;
var clock_H_After_06;
var H_After_06_temp ;
var H_After_06_temperature = H_After_06_temp.toInt();
var H_After_06_condition;

var H_After_09_Hour;
var clock_H_After_09;
var H_After_09_temp;
var H_After_09_temperature = H_After_09_temp.toInt();
var H_After_09_condition;

var H_After_12_Hour;
var clock_H_After_12;
var H_After_12_temp;
var H_After_12_temperature = H_After_12_temp.toInt();
var H_After_12_condition;

var H_After_15_Hour;
var clock_H_After_15;
var H_After_15_temp;
var H_After_15_temperature = H_After_15_temp.toInt();
var H_After_15_condition;

var H_After_18_Hour;
var clock_H_After_18;
var H_After_18_temp;
var H_After_18_temperature = H_After_18_temp.toInt();
var H_After_18_condition;

var H_After_21_Hour;
var clock_H_After_21;
var H_After_21_temp;
var H_After_21_temperature = H_After_21_temp.toInt();
var H_After_21_condition;

// ForDailyCastData
final Day = DateFormat('MMM / dd');
var Today;

var Tomorrow;
var Tomorrow_Hour_12;
var Tomorrow_temp ;
var Tomorrow_condition;

var ThirdDay;
var ThirdDay_Hour_12;
var ThirdDay_temp ;
var ThirdDay_condition;

var FourthDay;
var FourthDay_Hour_12;
var FourthDay_temp ;
var FourthDay_condition;

var FifthDay;
var FifthDay_Hour_12;
var FifthDay_temp;
var FifthDay_condition;

// Style
const TitleStyle = TextStyle(
  fontFamily: 'Caveat-Regular',
  fontSize: 40,
  fontWeight: FontWeight.w700,
);

const ByttomtextStyle = TextStyle(
fontFamily: 'Kalam-Regular', fontSize: 30);

const textStyle = TextStyle(
    fontFamily: 'Kalam-Regular', fontSize: 30,color:Colors.white );
const AlertButtextStyle = TextStyle(color: Colors.white, fontSize: 20);

const ConTextStyle = TextStyle(
    fontFamily: 'Kalam-Regular', fontSize: 18,color:Colors.white );