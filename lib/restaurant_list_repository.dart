import 'dart:convert';

import 'package:flutter_restaurant_listing_intermediate/restaurant_model.dart';
import 'package:http/http.dart' as http;

class RestaurantServices {
  http.Client client = http.Client();

  Future<RestaurantList?> fetchRestaurant() async {
    final url = Uri.parse(
      'https://jsonmock.hackerrank.com/api/food_outlets',
    );

    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse =
            json.decode(response.body);
        return RestaurantList.fromJson(jsonResponse);
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }
}