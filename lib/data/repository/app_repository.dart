import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';
import '../models/main/category_item.dart';
import '../models/main/products_item.dart';

class ApiProvider {
  Future<List<ProductItem>> getAllProducts() async {
    try {
      Response response = await https
          .get(Uri.parse("https://third-exam.free.mockoapp.net/products"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<ProductItem> products = (jsonData as List?)
            ?.map((item) => ProductItem.fromJson(item))
            .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  Future<List<CategoryItem>> getAllCategories() async {
    try {
      Response response = await https
          .get(Uri.parse("https://third-exam.free.mockoapp.net/categories"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<CategoryItem> categories = (jsonData as List?)
            ?.map((item) => CategoryItem.fromJson(item))
            .toList() ??
            [];
        return categories;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  Future<List<ProductItem>> getCategoryProducts({required int id}) async {
    try {
      Response response = await https.get(
          Uri.parse("https://third-exam.free.mockoapp.net/categories/$id"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<ProductItem> products = (jsonData as List?)
            ?.map((item) => ProductItem.fromJson(item))
            .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
