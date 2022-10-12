// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restoran_dicoding/src/helper/public_function.dart';
import 'package:restoran_dicoding/src/model/restaurants.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc() : super(RestaurantInitial()) {
    on<GetRestaurantListRequest>((event, emit) async {
      await _getRestaurantList(emit);
    });
  }
}

Future<void> _getRestaurantList(Emitter<RestaurantState> emit) async {
  emit(GetRestaurantListWaiting());
  try {
    RestaurantsResponse data = await getListRestaurant();
    emit(GetRestaurantListSuccess(data));
  } catch (ex) {
    emit(GetRestaurantListError(errorMessage: ex.toString()));
  }
}
