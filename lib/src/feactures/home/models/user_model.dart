import 'package:handyman/src/feactures/home/models/category_model.dart';

class UsersModel {
  late final String id;
  late final String name;
  late final double qualification;
  late final int reviews;
  late final int pricePerHour;
  late final String status;
  late final bool topRated;
  late final String photo;
  late final List<CategoryModel> categories;

  UsersModel({
    required this.id,
    required this.name,
    required this.qualification,
    required this.reviews,
    required this.pricePerHour,
    required this.status,
    required this.topRated,
    required this.photo,
    required this.categories,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    qualification = json['qualification'];
    reviews = json['reviews'];
    pricePerHour = json['pricePerHour'];
    status = json['status'];
    topRated = json['topRated'];
    photo = json['photo'];
    categories = List.from(
      json['categories'],
    ).map((e) => CategoryModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['qualification'] = qualification;
    data['reviews'] = reviews;
    data['pricePerHour'] = pricePerHour;
    data['status'] = status;
    data['topRated'] = topRated;
    data['photo'] = photo;
    data['categories'] = categories.map((e) => e.toJson()).toList();
    return data;
  }
}
