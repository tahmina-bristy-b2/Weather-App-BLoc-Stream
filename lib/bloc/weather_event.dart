part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherLoadedEvent extends WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  final String countryName;
  const GetWeatherEvent({required this.countryName});
  @override
  List<Object> get props => [countryName];
}
