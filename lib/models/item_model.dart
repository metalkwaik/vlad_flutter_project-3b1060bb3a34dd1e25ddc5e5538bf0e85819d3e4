class Products {
  Categoris? categoris;
  Products({this.categoris});
  Products.fromJson(Map<String, dynamic> json) {
    categoris = json['categoris'] != null
        ? Categoris.fromJson(json['categoris'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categoris != null) {
      data['categoris'] = categoris!.toJson();
    }
    return data;
  }
}

class Categoris {
  ProductsCategoris? burgers;
  ProductsCategoris? drinks;
  ProductsCategoris? snacks;

  Categoris({this.burgers, this.drinks, this.snacks});

  Categoris.fromJson(Map<String, dynamic> json) {
    burgers = json['burgers'] != null
        ? ProductsCategoris.fromJson(json['burgers'])
        : null;
    drinks = json['drinks'] != null
        ? ProductsCategoris.fromJson(json['drinks'])
        : null;
    snacks = json['snacks'] != null
        ? ProductsCategoris.fromJson(json['snacks'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (burgers != null) {
      data['burgers'] = burgers!.toJson();
    }
    if (drinks != null) {
      data['drinks'] = drinks!.toJson();
    }
    if (snacks != null) {
      data['snacks'] = snacks!.toJson();
    }
    return data;
  }
}

class ProductsCategoris {
  List<ProductData>? products;
  ProductsCategoris({this.products});
  ProductsCategoris.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductData>[];
      json['products'].forEach((v) {
        products!.add(ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  String? description;
  String? img;
  String? name;
  int? price;
  int? id;

  ProductData({this.description, this.img, this.name, this.price, this.id});

  ProductData.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    img = json['img'];
    name = json['name'];
    price = json['prise'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['img'] = img;
    data['name'] = name;
    data['prise'] = price;
    data['id'] = id;
    return data;
  }
}
