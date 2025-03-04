// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:weather/models/weather_model.dart';
// import 'package:weather/service/weather_service.dart';

// part 'weather_state.dart';

// class WeatherCubit extends Cubit<WeatherState> {
//   WeatherCubit({required this.weatherService}) : super(WeatherLoading());
//   WeatherService weatherService;
//   WeatherModel? weatherModel;
//   void getWeather(String cityName) async {
//     emit(WeatherLoading());
//     try {
//       weatherModel = await weatherService.getCurrentWeather(cityName: cityName);
//       emit(WeatherSuccess());
//     } on Exception catch (e) {
//       emit(WeatherFailure());
//     }
//   }
// }
