import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/weather_state.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/repo/weather_repo.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRespository _repository;

  WeatherCubit(this._repository) : super(WeatherInitialState());

  final queryController = TextEditingController();

  Future getWeather(var lat, var lan) async {
    emit(WeatherLoadingState());

    try {
      final WeatherModel? weather = await _repository.getWeather(lat, lan);
      emit(WeatherLoadedState(weather!));
    } on SocketException {
      emit(WeatherErrorState("Please check your internet connection."));
    } on HttpException {
      emit(WeatherErrorState("Something went wrong."));
    } on FormatException {
      emit(WeatherErrorState("Something went wrong."));
    }
  }
}
