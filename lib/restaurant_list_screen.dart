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

  void fetchRestaurantData() async {
    // Response from the RestaurantServices
    // write to the logic for fetching the data 
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
            "Restaurants Near By You",
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
        ),
        body: _errorMessage != null
                ? Center(child: Text('')) // the error message
                : _restaurants.isEmpty
                    ? Center(child: Text('')) // the error message
                    : Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,vertical: 12
                      ),
                      child: ListView.builder(
                          itemCount: _restaurants.length,
                          itemBuilder: (context, index) {
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
                                          "", // name of the restaurant
                                          style:
                                              TextStyle(color: Color(0xFF000000)),
                                        ),
                                        Text(
                                          "", // city of the restaurant
                                          style:
                                              TextStyle(color: Color(0xFF000000)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "", // estimated cost of the restaurant
                                          style:
                                              TextStyle(color: Color(0xFF000000)),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "", // average rating of the restaurant
                                              style: TextStyle(
                                                  color: Color(0xFF000000)),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Color(0xFF097bbf),
                                            )
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
      ),
    );
  }
}
