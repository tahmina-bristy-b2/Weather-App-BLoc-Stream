import 'package:bloc/bloc.dart';
import 'package:counternew/weather_model.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {
      emit(WeatherLoading());
    });
    // ignore: void_checks
    on<GetWeatherEvent>((event, emit) {
      emit(WeatherLoading());

      //emit(const WeatherLoaded(weather: []));
    });
  }
}
