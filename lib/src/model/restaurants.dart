class RestaurantsMenusDrinks {
  String? name;

  RestaurantsMenusDrinks({
    this.name,
  });
  RestaurantsMenusDrinks.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class RestaurantsMenusFoods {
  String? name;

  RestaurantsMenusFoods({
    this.name,
  });
  RestaurantsMenusFoods.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class RestaurantsMenus {
  List<RestaurantsMenusFoods>? foods;
  List<RestaurantsMenusDrinks>? drinks;

  RestaurantsMenus({
    this.foods,
    this.drinks,
  });
  RestaurantsMenus.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      final v = json['foods'];
      final arr0 = <RestaurantsMenusFoods>[];
      v.forEach((v) {
        arr0.add(RestaurantsMenusFoods.fromJson(v));
      });
      foods = arr0;
    }
    if (json['drinks'] != null) {
      final v = json['drinks'];
      final arr0 = <RestaurantsMenusDrinks>[];
      v.forEach((v) {
        arr0.add(RestaurantsMenusDrinks.fromJson(v));
      });
      drinks = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (foods != null) {
      final v = foods;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v.toJson());
      }
      data['foods'] = arr0;
    }
    if (drinks != null) {
      final v = drinks;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v.toJson());
      }
      data['drinks'] = arr0;
    }
    return data;
  }
}

class Restaurants {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;
  RestaurantsMenus? menus;

  Restaurants({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });
  Restaurants.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    description = json['description']?.toString();
    pictureId = json['pictureId']?.toString();
    city = json['city']?.toString();
    rating = json['rating']?.toDouble();
    menus = (json['menus'] != null)
        ? RestaurantsMenus.fromJson(json['menus'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['pictureId'] = pictureId;
    data['city'] = city;
    data['rating'] = rating;
    if (menus != null) {
      data['menus'] = menus!.toJson();
    }
    return data;
  }
}

class RestaurantsResponse {
  List<Restaurants>? restaurants;

  RestaurantsResponse({
    this.restaurants,
  });
  RestaurantsResponse.fromJson(Map<String, dynamic> json) {
    if (json['restaurants'] != null) {
      final v = json['restaurants'];
      final arr0 = <Restaurants>[];
      v.forEach((v) {
        arr0.add(Restaurants.fromJson(v));
      });
      restaurants = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (restaurants != null) {
      final v = restaurants;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v.toJson());
      }
      data['restaurants'] = arr0;
    }
    return data;
  }
}
