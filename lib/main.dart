import 'package:flutter/material.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondation),
              ),
              debugShowCheckedModeBanner: false,
              home: const Scaffold(
                body: HomeView(),
              ),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
      return Colors.amber;
    case "Clear":
      return Colors.indigo;

    case "Partly cloudy":
    case "Overcast":
      return Colors.blueGrey;
    case "Cloudy":
      return Colors.grey;

    case "Mist":
    case "Fog":
      return Colors.grey;

    case "Patchy rain possible":
    case "Light rain":
    case "Patchy light rain":
    case "Light rain shower":
      return Colors.lightBlue;

    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Torrential rain shower":
      return Colors.blue;

    case "Patchy snow possible":
    case "Light snow":
    case "Patchy light snow":
    case "Light snow showers":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Heavy snow":
    case "Patchy heavy snow":
    case "Moderate or heavy snow showers":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
    case "Blowing snow":
    case "Blizzard":
      return Colors.lightBlue;

    case "Patchy sleet possible":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.lightBlue;

    case "Patchy freezing drizzle possible":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
      return Colors.cyan;

    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.deepPurple;

    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.cyan;

    default:
      return Colors.blueGrey;
  }
}
