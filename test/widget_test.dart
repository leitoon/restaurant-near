import 'package:flutter_restaurant_listing_intermediate/restaurant_list_screen.dart';
import 'package:flutter_restaurant_listing_intermediate/restaurant_model.dart';
import 'package:flutter_restaurant_listing_intermediate/restaurant_list_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';

class MockRestaurantServices extends Mock implements RestaurantServices {
  @override
  Future<RestaurantList?> fetchRestaurant() {
    return super.noSuchMethod(
      Invocation.method(#fetchRestaurant, []),
      returnValue: Future.value(null),
      returnValueForMissingStub: Future.value(null),
    );
  }
}

void main() {
  testWidgets('shows loading indicator when fetching data',
      (WidgetTester tester) async {
    final mockServices = MockRestaurantServices();
    final restaurantList = RestaurantList(data: [
      Data(
          name: 'Cafe Juanita',
          city: 'Seattle',
          estimatedCost: 160,
          userRating: UserRating(averageRating: 4.9)),
      Data(
          name: 'Cafe Munir',
          city: 'Seattle',
          estimatedCost: 160,
          userRating: UserRating(averageRating: 4.9)),
    ]);
    when(mockServices.fetchRestaurant()).thenAnswer((_) async => null);
    when(mockServices.fetchRestaurant())
        .thenAnswer((_) async => restaurantList);

    await tester.pumpWidget(
      MaterialApp(
        home: RestaurantListScreen(services: mockServices),
      ),
    );
    print('Checking indicator found when data load initially...');
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    print('Indicator found when data load initially...');
  });

  testWidgets('shows error message when fetching fails',
      (WidgetTester tester) async {
    final mockServices = MockRestaurantServices();
    when(mockServices.fetchRestaurant())
        .thenThrow(Exception('Failed to fetch'));

    await tester.pumpWidget(
      MaterialApp(
        home: RestaurantListScreen(services: mockServices),
      ),
    );

    await tester.pumpAndSettle();
    print('Checking error message found when get error from API...');
    expect(find.text('Failed to load restaurant list.'), findsWidgets);
    print('Error message found when get error from API...');
  });

  testWidgets('shows restaurant list when fetching is successful',
      (WidgetTester tester) async {
    final mockServices = MockRestaurantServices();
    final restaurantList = RestaurantList(data: [
      Data(
          name: 'Cafe Juanita',
          city: 'Seattle',
          estimatedCost: 160,
          userRating: UserRating(averageRating: 4.9)),
      Data(
          name: 'Cafe Munir',
          city: 'Seattle',
          estimatedCost: 160,
          userRating: UserRating(averageRating: 4.9)),
    ]);

    when(mockServices.fetchRestaurant())
        .thenAnswer((_) async => restaurantList);

    await tester.pumpWidget(
      MaterialApp(
        home: RestaurantListScreen(services: mockServices),
      ),
    );

    await tester.pumpAndSettle();
    print('Checking List component data is correct ...');
    expect(find.text('Cafe Juanita'), findsWidgets);
    expect(find.text('Cafe Munir'), findsWidgets);
    expect(find.text('Seattle'), findsWidgets);
    expect(find.text('160'), findsWidgets);
    expect(find.text('4.9'), findsWidgets);
    print('List component data is correct ...');
  });
  testWidgets(
      'shows no data available message when the restaurant list is empty',
      (WidgetTester tester) async {
    final mockServices = MockRestaurantServices();
    final restaurantList = RestaurantList(data: []);

    when(mockServices.fetchRestaurant())
        .thenAnswer((_) async => restaurantList);

    await tester.pumpWidget(
      MaterialApp(
        home: RestaurantListScreen(services: mockServices),
      ),
    );

    await tester.pumpAndSettle();
    print('Checking Empty error message when list data is empty ...');
    expect(find.text('No data available.'), findsOneWidget);
    print('Empty error message when list data is empty ...');
  });
  testWidgets(
      'AppBar title shows correct number of restaurants when list is not empty',
      (WidgetTester tester) async {
    final mockServices = MockRestaurantServices();
    final restaurantList = RestaurantList(data: [
      Data(
          name: 'Cafe Juanita',
          city: 'Seattle',
          estimatedCost: 160,
          userRating: UserRating(averageRating: 4.9)),
      Data(
          name: 'Cafe Munir',
          city: 'Seattle',
          estimatedCost: 160,
          userRating: UserRating(averageRating: 4.9)),
    ]);

    when(mockServices.fetchRestaurant())
        .thenAnswer((_) async => restaurantList);

    await tester.pumpWidget(
      MaterialApp(
        home: RestaurantListScreen(services: mockServices),
      ),
    );

    await tester.pumpAndSettle();
    print(
        'Checking AppBar title shows correct number of restaurants when list is not empty...');
    expect(find.text('2 Restaurants Near By You'), findsOneWidget);
    print(
        'AppBar title shows correct number of restaurants when list is not empty...');
  });

  testWidgets(
      'AppBar title shows correct message when restaurant list is empty',
      (WidgetTester tester) async {
    final mockServices = MockRestaurantServices();
    final restaurantList = RestaurantList(data: []);

    when(mockServices.fetchRestaurant())
        .thenAnswer((_) async => restaurantList);

    await tester.pumpWidget(
      MaterialApp(
        home: RestaurantListScreen(services: mockServices),
      ),
    );

    await tester.pumpAndSettle();
    print(
        'Checking AppBar title shows correct message when restaurant list is empty...');
    expect(find.text('0 Restaurants Near By You'), findsOneWidget);
    print(
        'AppBar title shows correct message when restaurant list is empty...');
  });
}
