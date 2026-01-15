# Flutter: Restaurant Listing From API

Create a restaurant listing application, as shown below. Application requirements follow, and the application must pass all the unit tests.

## Environment

- Flutter 3.3.20
- Dart 2.18.6

## Read-Only Files

- test/\*

## Commands

- run:

```bash
flutter build web && flutter run --release --device-id web-server --web-hostname 0.0.0.0 --web-port 8000
```

- install:

```bash
flutter build web
```

- test:

```bash
flutter build web && flutter test
```

## Application Demo

![An app that displays a list of restaurants.](https://hrcdn.net/s3_pub/istreet-assets/Xg9jqBrMV2aE_4tXhqRJ3g/1910368.gif)

## Functionality Requirements

Complete the implementation according to these requirements:

- To access the list of restaurant items, make an HTTP GET request using the inbuilt fetch library to https://jsonmock.hackerrank.com/api/food_outlets
- The response is a JSON with the following data with 4 fields:
  - data: An array of restaurant-list objects. Each object should include:
    - _restaurant_name_: The name of the restaurant [STRING]
    - _restaurant_city_: The city of the restaurant [STRING]
    - _restaurant_estimated-cost_: The estimated cost of the restaurant [STRING]
    - _restaurant_average-rating_: The average rating of the restaurant [STRING]
- The CircularProgressIndicator component should be displayed while the data is loading.
- Once data is successfully loaded, remove the CircularProgressIndicator and display the Listing component.
- The Listing component should accept an array of inventories as a prop. Each element in this array represents a single restaurant item and follows the schema mentioned above.
- Header text should be displayed for total restaurant data.
- In the List component, each restaurant item should be rendered as a ListItem component.
- Complete the ListItem component to display all Restaurant names, cities, estimated costs, and average ratings.
- Users should be able to see the restaurant list.

## Testing Requirements

Initially, the file is filled with boilerplate code. Note the following:

- When data is loaded initially, the loader should be rendered as a `<CircularProgressIndicator>`.
- Header text must be rendered as a `<Text>` element.
- The failed error message, like `Failed to load restaurant list.`, should be rendered as a `<Text>` element when getting an error from the API.
- The empty error message, like `No data available.`, should be rendered as a `<Text>` element when getting an empty list.
- Each restaurant name must be rendered as a `<Text>` element.
- Each restaurant area must be rendered as a `<Text>` element.
- Each restaurant's estimated cost must be rendered as a `<Text>` element.
- Each restaurant average rating must be rendered as a `<Text>` element.

The component has these testID attributes for test cases and certain classes and IDs for rendering purposes. They should not be changed.
