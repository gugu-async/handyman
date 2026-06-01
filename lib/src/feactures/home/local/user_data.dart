import 'package:handyman/src/core/assets/app_assets.dart';
import 'package:handyman/src/feactures/home/models/category_model.dart';
import 'package:handyman/src/feactures/home/models/user_model.dart';

class UserDataLocal {
  static String aboutMe =
      'Im a great handyman with 15yr of experience and completed lots of job consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua';

  List<UsersModel> data = [
    UsersModel(
        id: '1',
        name: 'Harry Edward',
        qualification: 5.0,
        reviews: 53,
        pricePerHour: 55,
        status: "Available",
        topRated: true,
        photo: AppAssets.perfil1,
        categories: [
          CategoryModel(name: "Cleaning"),
          CategoryModel(name: "Home Cleaning"),
          CategoryModel(name: "Office Cleaning"),
          CategoryModel(name: "Garden Cleaning"),
        ]),
    UsersModel(
        id: '2',
        name: 'Elvis Presley',
        qualification: 4.0,
        reviews: 37,
        pricePerHour: 70,
        status: "Available",
        topRated: false,
        photo: AppAssets.perfil2,
        categories: [
          CategoryModel(name: "Cleaning"),
          CategoryModel(name: "Home Cleaning")
        ]),
    UsersModel(
        id: '3',
        name: 'Georgina García',
        qualification: 5.0,
        reviews: 124,
        pricePerHour: 78,
        status: "Available",
        topRated: true,
        photo: AppAssets.perfil3,
        categories: [
          CategoryModel(name: "Home Cleaning"),
          CategoryModel(name: "Office Cleaning"),
          CategoryModel(name: "Garden Cleaning")
        ]),
    UsersModel(
        id: '4',
        name: 'Jackie Wilson',
        qualification: 5.0,
        reviews: 24,
        pricePerHour: 90,
        status: "Available",
        topRated: true,
        photo: AppAssets.perfil4,
        categories: [
          CategoryModel(name: "Cleaning"),
          CategoryModel(name: "Home Cleaning"),
          CategoryModel(name: "Garden Cleaning")
        ]),
    UsersModel(
        id: '5',
        name: 'John Lennon',
        qualification: 4.0,
        reviews: 11,
        pricePerHour: 75,
        status: "NoAvailable",
        topRated: false,
        photo: AppAssets.perfil5,
        categories: [
          CategoryModel(name: "Home Cleaning"),
        ]),
    UsersModel(
        id: '6',
        name: 'Liam Jones',
        qualification: 5.0,
        reviews: 31,
        pricePerHour: 85,
        status: "NoAvailable",
        topRated: false,
        photo: AppAssets.perfil6,
        categories: [
          CategoryModel(name: "Office Cleaning"),
          CategoryModel(name: "Garden Cleaning"),
        ])
  ];

  static var menuData = [
    MenuModel(name: "Profile", icon: AppAssets.user),
    MenuModel(name: "Projects", icon: AppAssets.projects),
    MenuModel(name: "Message", icon: AppAssets.message),
    MenuModel(name: "Help Video", icon: AppAssets.helpVideo),
    MenuModel(name: "Share", icon: AppAssets.share),
    MenuModel(name: "Rate App", icon: AppAssets.rateApp)
  ];
}

class MenuModel {
  final String name;
  final String icon;
  MenuModel({
    required this.name,
    required this.icon,
  });
}
