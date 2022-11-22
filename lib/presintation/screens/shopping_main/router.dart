import 'package:flutter/material.dart';
import '../../../data/models/main/category_item.dart';
import '../../../data/my_repository.dart';
import '../../../utils/constants.dart';
import '../category_products/category_products_screen.dart';
import '../favourites_products/favourites_products_screen.dart';
import 'main_box/main_box_screen.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case tabsRoute:
        return MaterialPageRoute(
          builder: (_) => MainBox(),
        );
      case favouritesRoute:
        return MaterialPageRoute(builder: (_) {
          MyRepository myRepository = settings.arguments as MyRepository;
          return FavouritesScreen(myRepository: myRepository);
        });
      case categoriesProductsRoute:
        return MaterialPageRoute(builder: (_) {
          var list = settings.arguments as List<dynamic>;
          MyRepository myRepository = list[0];
          CategoryItem categoryItem = list[1];
          return CategoryProductsScreen(
            myRepository: myRepository,
            category: categoryItem,
          );
        });
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
