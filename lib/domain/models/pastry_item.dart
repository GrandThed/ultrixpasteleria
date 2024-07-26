class PastryItem {
  bool? available;
  String? image;
  String? id;
  String? title;
  int? price;
  String? description;
  List<NutritionalValue>? nutritionalValue;

  PastryItem(
      {this.available,
      this.image,
      this.title,
      this.id,
      this.price,
      this.description,
      this.nutritionalValue});

  PastryItem.fromJson(Map<String, dynamic> json, String currentId) {
    available = json['available'];
    image = json['image'];
    title = json['title'];
    id = currentId;
    price = json['price'];
    description = json['description'];
    if (json['nutritionalValue'] != null) {
      nutritionalValue = <NutritionalValue>[];
      json['nutritionalValue'].forEach((v) {
        nutritionalValue!.add(NutritionalValue.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['available'] = available;
    data['image'] = image;
    data['title'] = title;
    data['id'] = id;
    data['price'] = price;
    data['description'] = description;
    if (nutritionalValue != null) {
      data['nutritionalValue'] =
          nutritionalValue!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NutritionalValue {
  String? name;
  int? value;

  NutritionalValue({this.name, this.value});

  NutritionalValue.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}
