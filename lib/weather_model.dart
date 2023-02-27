import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final String countryName;
  final double temparature;

  WeatherModel({
    required this.countryName,
    required this.temparature,
  });

  @override
  List<Object?> get props => [countryName, temparature];
}
