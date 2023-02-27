import 'package:counternew/bloc/weather_bloc.dart';
import 'package:counternew/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WeatherPage(),
      ),
    );
  }
}

class WeatherPage extends StatefulWidget {
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final weather = WeatherBloc();
  @override
  Widget build(BuildContext context) {
    //final notifier = context.watch<ValueNotifier>();
    //print("object======$notifier");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocListener<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherLoaded) {
              print("WeatherListner_________________________");
            }

            // TODO: implement listener
          },
          child: BlocBuilder<WeatherBloc, WeatherState>(
            // bloc: weather,
            builder: (BuildContext context, WeatherState state) {
              if (state is WeatherInitial) {
                print("WeatherInitial");
                return buildInitialPart();
              }
              if (state is WeatherLoaded) {
                print("WeatherLoaded");
                // print("ami eikhen");
                return buildwithResult(state.weather);
              }
              if (state is WeatherLoading) {
                const Center(child: CircularProgressIndicator());
                print("WeatherLoading");
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Column buildwithResult(WeatherModel weatherModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // ignore: prefer_const_constructors
        Text(
          weatherModel.countryName,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "${weatherModel.temparature}",
          style: const TextStyle(fontSize: 80),
        ),
        CityInputField(),
      ],
    );
  }

  Widget buildInitialPart() {
    return Center(
      child: CityInputField(),
    );
  }
}

class $ {}

class CityInputField extends StatefulWidget {
  @override
  _CityInputFieldState createState() => _CityInputFieldState();
}

class _CityInputFieldState extends State<CityInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: submitCityName,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(String cityName) {
    //print("object=$cityName");
    context.read<WeatherBloc>().add(GetWeatherEvent(countryName: cityName));

    // We will use the city name to search for the fake forecast
  }
}
