part of 'restaurant_bloc.dart';

@immutable
abstract class RestaurantState {}

class RestaurantInitial extends RestaurantState {}

class GetRestaurantListSuccess extends RestaurantState {
  final RestaurantsResponse response;
  GetRestaurantListSuccess(this.response);
}

class GetRestaurantListError extends RestaurantState {
  final String? errorMessage;
  GetRestaurantListError({this.errorMessage});
}

class GetRestaurantListWaiting extends RestaurantState {}
