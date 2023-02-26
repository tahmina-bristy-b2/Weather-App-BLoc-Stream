import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  String countryName;

  WeatherModel({required this.countryName});

  @override
  List<Object?> get props => [countryName];
}
