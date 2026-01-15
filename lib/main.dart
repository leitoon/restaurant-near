import 'package:flutter/material.dart';
import 'package:flutter_restaurant_listing_intermediate/restaurant_list_repository.dart';
import 'package:flutter_restaurant_listing_intermediate/restaurant_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RestaurantListScreen(
        services: RestaurantServices(),
      ),
    );
  }
}
