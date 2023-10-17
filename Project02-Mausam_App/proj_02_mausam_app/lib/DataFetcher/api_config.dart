import 'dart:convert';
import 'package:http/http.dart';

class ApiData {
  ///  {coord: {lon: 77.2167, lat: 28.6667}, weather: [{id: 721, main: Haze, description: haze, icon: 50d}], base: stations, main: {temp: 308.2, feels_like: 306.8, temp_min: 308.2, temp_max: 308.2, pressure: 1012, humidity: 24}, visibility: 3500, wind: {speed: 4.12, deg: 300}, clouds: {all: 0}, dt: 1697192376, sys: {type: 1, id: 9165, country: IN, sunrise: 1697158212, sunset: 1697199871}, timezone: 19800, id: 1273294, name: Delhi, cod: 200}

  String? typeOfData;
  String? apiResponseMessage;
  String? lat;
  String? lon;
  String? location;
  String? weather;
  String? weatherDesc;
  String? temp;
  String? feelsLike;
  String? pressure;
  String? humidity;
  Map? windDetails;
  String? sunRise;
  String? sunSet;
  String? windSpeed;
  String? windDeg;
  String? cloudStatus;
  String? todayDate;
  String? weatherICon;
  String? searchedLocation;
  Map<dynamic, dynamic> customWeatherData = {};
  String weatherAPIurl = 'https://api.openweathermap.org/data/2.5/';
  Map apikeys = {
    'default': "a4e2837340e48848376046081baa0193",
    'current': 'f41876d95649c742f2d05ec20a48264f',
    'forecast5': 'c12ef342000a353dfac8ffdd06d0546a',
    'weathermaps': '826f03b87b852612f6473385f6b2b9b9',
    'air-pollution': '6c4d30ec18f9f67811a99d1bbaf89e4f',
    'geocoding-api': '1a571ec1d115177b65ef8c6b448b60cd',
  };

  Map urlKeyWords = {
    'current': 'weather',
    'forecast5': 'forecast',
    'air-pollution': 'air_pollution',
  };

  ApiData({this.location, this.typeOfData}) {
    location = this.location;
    typeOfData = this.typeOfData;
  }
  String getWeatherAppUrl(location, typeOfData) {
    String fullUrl = '';
    String extraURLaddiotions;
    String urlAdditions;

    urlAdditions = typeOfData;
    extraURLaddiotions = urlKeyWords[urlAdditions] +
        '?q=$location&appid=' +
        apikeys[urlAdditions] +
        '&units=metric';

    fullUrl = weatherAPIurl + extraURLaddiotions;
    return fullUrl;
  }

  Future<void> getWeatherData() async {
    try {
      String weatherUrl = getWeatherAppUrl(location, typeOfData);
      Response weatherApiResponse = await get(Uri.parse(weatherUrl));

      // Lat and lon of the Location

      Map completeData = jsonDecode(weatherApiResponse.body);
      if (completeData['cod'] != 200) {
        apiResponseMessage = completeData['message'];
        customWeatherData.addAll({
          'apiResponseMessage': apiResponseMessage,
          'weather': "Not Found",
          'weatherDesc': "Not Found",
          'temp': "Not Found",
          'feelsLike': "Not Found",
          'pressure': "Not Found",
          'humidity': "Not Found",
          'sunRise': "Not Found",
          'sunSet': "Not Found",
          'windSpeed': "Not Found",
          'windDeg': "Not Found",
          'cloudStatus': "Not Found",
          'currentDate': "Not Found",
          'weatherICon': "Not Found",
          'searchedLocation': "Not Found",
        });
      } else {
        print(completeData);
        lat = completeData['coord']['lat'].toString();
        lon = completeData['coord']['lon'].toString();
        apiResponseMessage = '';

        // weather and its desc
        List weatherData = completeData['weather'];
        Map completeWeatherData = weatherData[0];
        weather = completeWeatherData['main'];
        weatherDesc = completeWeatherData['description'];
        weatherICon = completeWeatherData['icon'];

        // temp and feels like and pressure and humidity
        Map mainData = completeData['main'];
        temp = mainData['temp'].toString();
        feelsLike = mainData['feels_like'].toString();
        pressure = mainData['pressure'].toString();
        humidity = mainData['humidity'].toString();

        //sunrise and sunset
        sunRise = completeData['sys']['sunrise'].toString();
        sunSet = completeData['sys']['sunset'].toString();

        searchedLocation = completeData['name'] +
            "," +
            completeData['sys']['country'].toString();

        // windDetails
        windSpeed = completeData['wind']['speed'].toString();
        windDeg = completeData['wind']['deg'].toString();
        cloudStatus = completeData['clouds']['all'].toString();

        todayDate = completeData['dt'].toString();

        // Below map is used to send all the data
        customWeatherData.addAll({
          'apiResponseMessage': apiResponseMessage,
          'weather': weather,
          'weatherDesc': weatherDesc,
          'temp': temp,
          'feelsLike': feelsLike,
          'pressure': pressure,
          'humidity': humidity,
          'sunRise': sunRise,
          'sunSet': sunSet,
          'windSpeed': windSpeed,
          'windDeg': windDeg,
          'cloudStatus': cloudStatus,
          'currentDate': todayDate,
          'weatherICon': weatherICon,
          'searchedLocation': searchedLocation,
        });
      }
    } catch (e) {
      print("Got a Error $e");
    }
  }
}
