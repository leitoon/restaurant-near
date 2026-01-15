class RestaurantList {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;

  RestaurantList(
      {this.page, this.perPage, this.total, this.totalPages, this.data});

  RestaurantList.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? city;
  String? name;
  int? estimatedCost;
  UserRating? userRating;
  int? id;

  Data({this.city, this.name, this.estimatedCost, this.userRating, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    name = json['name'];
    estimatedCost = json['estimated_cost'];
    userRating = json['user_rating'] != null
        ? new UserRating.fromJson(json['user_rating'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['name'] = this.name;
    data['estimated_cost'] = this.estimatedCost;
    if (this.userRating != null) {
      data['user_rating'] = this.userRating!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class UserRating {
  double? averageRating;
  int? votes;

  UserRating({this.averageRating, this.votes});

  UserRating.fromJson(Map<String, dynamic> json) {
    averageRating = json['average_rating'];
    votes = json['votes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average_rating'] = this.averageRating;
    data['votes'] = this.votes;
    return data;
  }
}
