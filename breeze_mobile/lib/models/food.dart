class Food {
  late String name;
  late String description;
  late String imagePath;
  late num price;
  late FoodCategory category;
  late List<Addon> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });

  Food.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    imagePath = json['imagePath'];
    price = json['price'];
    category = FoodCategory.fromStr(json['category']);
    availableAddons = [];
    var aa = json['availableAddons'];
    if (aa is List<dynamic>) {
      for (var value in aa) {
        availableAddons.add(Addon.fromJson(value));
      }
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["name"] = name;
    data["description"] = description;
    data["imagePath"] = imagePath;
    data["price"] = price;
    data["category"] = FoodCategory.toStr(category);
    data["availableAddons"] = availableAddons.map((e) => e.toJson());
    return data;
  }
}

enum FoodCategory {
  rice,
  noodles,
  sides,
  drinks;

  static String toStr(FoodCategory foodCategory) {
    if (foodCategory == rice) {
      return "rice";
    } else if (foodCategory == noodles) {
      return "noodles";
    } else if (foodCategory == sides) {
      return "sides";
    } else {
      return "drinks";
    }
  }

  static FoodCategory fromStr(String foodCategory) {
    if (foodCategory == 'rice') {
      return rice;
    } else if (foodCategory == 'noodles') {
      return noodles;
    } else if (foodCategory == 'sides') {
      return sides;
    } else {
      return drinks;
    }
  }
}

class Addon {
  late String name;
  late num price;

  Addon({
    required this.name,
    required this.price,
  });

  Addon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["name"] = name;
    data["price"] = price;
    return data;
  }
}

