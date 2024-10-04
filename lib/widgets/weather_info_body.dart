import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/main.dart';
import 'package:weather/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        getThemeColor(weatherModel.weatherCondation),
        getThemeColor(weatherModel.weatherCondation)[300]!,
        getThemeColor(weatherModel.weatherCondation)[50]!
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              'updated to ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Image.network("https:${weatherModel.image!}"),
                  Padding(
                    padding: const EdgeInsets.only(left: 95, right: 65),
                    child: Text(
                      weatherModel.temp.toString(),
                      style: const TextStyle(
                          fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Maxtemp: ${weatherModel.maxTemp.round()}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Mintemp: ${weatherModel.minTemp.round()}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondation,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
