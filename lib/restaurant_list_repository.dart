import 'package:flutter_restaurant_listing_intermediate/restaurant_model.dart';
import 'package:http/http.dart' as http;

class RestaurantServices {
  http.Client client = http.Client();

  Future<RestaurantList?> fetchRestaurant() async {
    // Use this URL to fetch the restaurant list "https://jsonmock.hackerrank.com/api/food_outlets"

    final response = "";
  }
}
