class PastryItem {
  bool? available;
  String? image;
  String? id;
  String? title;
  String? description;
  List<NutritionalValue>? nutritionalValue;

  PastryItem(
      {this.available,
      this.image,
      this.title,
      this.description,
      this.nutritionalValue});

  PastryItem.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    image = json['image'];
    title = json['title'];
    id = json['id'];
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

final pastryItemExample = PastryItem.fromJson({
  "id": "1",
  "available": true,
  "image": "url",
  "title": "Rustic Bakery",
  "description":
      "This charming bakery is known for its freshly baked goods, made with traditional recipes and high-quality ingredients. The aroma of freshly baked bread fills the air, inviting customers to indulge in a variety of delicious pastries and loaves.",
  "nutritionalValue": [
    {"name": "name", "value": 20},
    {"name": "name", "value": 30},
    {"name": "name", "value": 5},
    {"name": "name", "value": 11},
    {"name": "name", "value": 9}
  ]
});
