import 'package:flutter/material.dart';
import 'package:flutter_restaurant_listing_intermediate/restaurant_list_repository.dart';
import 'package:flutter_restaurant_listing_intermediate/restaurant_model.dart';

class RestaurantListScreen extends StatefulWidget {
  final RestaurantServices services;

  RestaurantListScreen({Key? key, required this.services}) : super(key: key);

  @override
  _RestaurantListScreenState createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  List<Data> _restaurants = [];
  String? _errorMessage;
  bool _isLoading = true;

  void fetchRestaurantData() async {
  try {
    final result = await widget.services.fetchRestaurant();

    setState(() {
      _isLoading = false;

      if (result == null) {
        _errorMessage = 'Failed to load restaurant list.';
        return;
      }

      if (result.data == null || result.data!.isEmpty) {
        _errorMessage = 'No data available.';
        _restaurants = [];
        return;
      }

      _restaurants = result.data!;
      _errorMessage = null;
    });
  } catch (_) {
    setState(() {
      _isLoading = false;
      _errorMessage = 'Failed to load restaurant list.';
      _restaurants = [];
    });
  }
}


  @override
  void initState() {
    super.initState();
    // Fetch restaurant data when the screen initializes
    fetchRestaurantData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1ba94c),
        title: Text(
              '${_restaurants.length} Restaurants Near By You',
              style: const TextStyle(color: Color(0xFFFFFFFF)),
            ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : _restaurants.isEmpty
                  ? const Center(child: Text('No data available.'))
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: ListView.builder(
                        itemCount: _restaurants.length,
                        itemBuilder: (context, index) {
                          final restaurant = _restaurants[index];

                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        restaurant.name ?? '',
                                      ),
                                      Text(
                                        restaurant.city ?? '',
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        restaurant.estimatedCost != null
                                            ? restaurant.estimatedCost
                                                .toString()
                                            : '',
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            restaurant.userRating?.averageRating
                                                    ?.toString() ??
                                                '',
                                          ),
                                          const Icon(
                                            Icons.star,
                                            size: 16,
                                            color: Color(0xFF097bbf),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
    ));
  }
}
