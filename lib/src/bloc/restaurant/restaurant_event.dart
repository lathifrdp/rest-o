part of 'restaurant_bloc.dart';

@immutable
abstract class RestaurantEvent {}

class GetRestaurantListRequest extends RestaurantEvent {
  GetRestaurantListRequest();
}
