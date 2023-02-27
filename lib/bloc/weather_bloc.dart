import 'package:counternew/weather_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    // ignore: void_checks
    on<GetWeatherEvent>((event, emit) async {
      print('${event.countryName}');
      final weather = await fetchApiDataFromFakeApi(event.countryName);
      print('111    ${weather.countryName}');
      emit(WeatherLoaded(weather: weather));

      //emit(const WeatherLoaded(weather: []));
    });
  }

  Future<WeatherModel> fetchApiDataFromFakeApi(String countryName) async {
    return WeatherModel(countryName: countryName, temparature: 35);
  }
}
