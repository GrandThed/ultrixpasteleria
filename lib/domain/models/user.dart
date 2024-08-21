class UserData {
  int? points;
  late String id;

  UserData({this.points, required this.id});

  UserData.fromJson(Map<String, dynamic> json, String userId) {
    points = json['points'];
    id = userId;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['points'] = points;
    data['id'] = id;
    return data;
  }
}
