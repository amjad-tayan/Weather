import 'package:http/http.dart' as Http;
import 'dart:convert' as Conventer;

class NetworkHelper {
  NetworkHelper({this.URL});
  final URL;
  Future getData() async {
    Http.Response response = await Http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      String Data = response.body;
      var WeatherData = Conventer.jsonDecode(Data);
      return WeatherData;
    } else
      print(response.statusCode);
  }
}
