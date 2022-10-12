// Fetch content from the json file
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:restoran_dicoding/src/model/restaurants.dart';

Future<RestaurantsResponse> getListRestaurant() async {
  final String response =
      await rootBundle.loadString('assets/local_restaurant.json');
  var data = await json.decode(response);
  RestaurantsResponse result = RestaurantsResponse.fromJson(data);
  return result;
}
