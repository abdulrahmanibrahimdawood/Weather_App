import 'package:weather/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailurState extends WeatherState {
  final String errorMessage;

  WeatherFailurState({required this.errorMessage});
}
