
import 'package:bloc/bloc.dart';
import 'package:learn_bloc_clean/data/repository/weather_repository.dart';
import 'package:learn_bloc_clean/model/weather_model.dart';
 import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>(_onFetchWeather);
  }



  void _onFetchWeather(WeatherEvent event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoading());
      var result = await weatherRepository.getCurrentWeather('Delhi');
      emit(WeatherSuccess(result));
    } catch (e) {
      emit(WeatherFailed(e.toString()));
    }
  }
}
