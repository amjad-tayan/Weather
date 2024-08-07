import 'package:flutter/material.dart';
import 'package:weather/services/widget.dart';
import 'package:weather/variables.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String? CityNameValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Search.jpg'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add city',
                  style: textStyle.copyWith(fontSize: 35),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white60),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 8)),
                        Icon(
                          Icons.search_sharp,
                          color: Colors.white,
                          size: 35,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Expanded(
                          child: TextField(
                              cursorColor: Colors.white,
                              decoration: InputDecoration.collapsed(
                                  hintText: 'Enter city',
                                  hintStyle: textStyle.copyWith(
                                      color: Colors.black87, fontSize: 20)),
                              style: textStyle.copyWith(
                                  color: Colors.black87, fontSize: 20),
                              onChanged: (String Newvalue) {
                                CityNameValue = Newvalue;
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15)),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, CityNameValue);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white60,
                      minimumSize: Size(150, 35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    child: Text('Search',
                        style: TextStyle(
                            fontFamily: 'Kalam-Regular',
                            letterSpacing: 2,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15)),
                Text('SUGGESTED CITIES :', style: textStyle),
                Divider(color: Colors.white, thickness: 2),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.vertical,
                    children: [
                      Row(
                        children: [
                          SUGGESTED_CITIES(
                              CityName: 'Berlin',
                              OnTap: () {
                                CityNameValue = 'Berlin';
                                Navigator.pop(context, CityNameValue);
                              }),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          SUGGESTED_CITIES(
                              CityName: 'Rome',
                              OnTap: () {
                                CityNameValue = 'Rome';
                                Navigator.pop(context, CityNameValue);
                              }),
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      Row(
                        children: [
                          SUGGESTED_CITIES(
                              CityName: 'Istanbul',
                              OnTap: () {
                                CityNameValue = 'Istanbul';
                                Navigator.pop(context, CityNameValue);
                              }),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          SUGGESTED_CITIES(
                              CityName: 'Munich',
                              OnTap: () {
                                CityNameValue = 'Munich';
                                Navigator.pop(context, CityNameValue);
                              }),
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      Row(
                        children: [
                          SUGGESTED_CITIES(
                              CityName: 'Copenhagen',
                              OnTap: () {
                                CityNameValue = 'Copenhagen';
                                Navigator.pop(context, CityNameValue);
                              }),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          SUGGESTED_CITIES(
                              CityName: 'New York',
                              OnTap: () {
                                CityNameValue = 'New York';
                                Navigator.pop(context, CityNameValue);
                              }),
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      Row(
                        children: [
                          SUGGESTED_CITIES(
                              CityName: 'Tokyo',
                              OnTap: () {
                                CityNameValue = 'Tokyo';
                                Navigator.pop(context, CityNameValue);
                              }),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          SUGGESTED_CITIES(
                              CityName: 'Paris',
                              OnTap: () {
                                CityNameValue = 'Paris';
                                Navigator.pop(context, CityNameValue);
                              }),
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      Row(
                        children: [
                          SUGGESTED_CITIES(
                              CityName: 'Moscow',
                              OnTap: () {
                                CityNameValue = 'Moscow';
                                Navigator.pop(context, CityNameValue);
                              }),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          SUGGESTED_CITIES(
                              CityName: 'Dubai',
                              OnTap: () {
                                CityNameValue = 'Dubai';
                                Navigator.pop(context, CityNameValue);
                              }),
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      Row(
                        children: [
                          SUGGESTED_CITIES(
                              CityName: 'Barcelona',
                              OnTap: () {
                                CityNameValue = 'Barcelona';
                                Navigator.pop(context, CityNameValue);
                              }),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          SUGGESTED_CITIES(
                              CityName: 'Palma',
                              OnTap: () {
                                CityNameValue = 'Palma';
                                Navigator.pop(context, CityNameValue);
                              }),
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      Row(
                        children: [
                          SUGGESTED_CITIES(
                              CityName: 'Milan',
                              OnTap: () {
                                CityNameValue = 'Milan';
                                Navigator.pop(context, CityNameValue);
                              }),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          SUGGESTED_CITIES(
                              CityName: 'Hong Kong',
                              OnTap: () {
                                CityNameValue = 'Hong Kong';
                                Navigator.pop(context, CityNameValue);
                              }),
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      Row(
                        children: [
                          SUGGESTED_CITIES(
                              CityName: 'Amsterdam',
                              OnTap: () {
                                CityNameValue = 'Amsterdam';
                                Navigator.pop(context, CityNameValue);
                              }),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          SUGGESTED_CITIES(
                              CityName: 'Manchester',
                              OnTap: () {
                                CityNameValue = 'Manchester';
                                Navigator.pop(context, CityNameValue);
                              }),
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      Row(
                        children: [
                          SUGGESTED_CITIES(
                              CityName: 'London',
                              OnTap: () {
                                CityNameValue = 'London';
                                Navigator.pop(context, CityNameValue);
                              }),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          SUGGESTED_CITIES(
                              CityName: 'San Francisco',
                              OnTap: () {
                                CityNameValue = 'San Francisco';
                                Navigator.pop(context, CityNameValue);
                              }),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
