import 'package:flutter/material.dart';
import 'package:shopping_app_exam/presintation/screens/category_products/widgets/products_item_view.dart';
import '../../../data/local_database/db/cached_product.dart';
import '../../../data/models/main/category_item.dart';
import '../../../data/models/main/products_item.dart';
import '../../../data/my_repository.dart';
import '../../../utils/utility_functions.dart';
class CategoryProductsScreen extends StatefulWidget {
  const CategoryProductsScreen({
    Key? key,
    required this.myRepository,
    required this.category,
  }) : super(key: key);

  final MyRepository myRepository;
  final CategoryItem category;

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: FutureBuilder<dynamic>(
        future: Future.wait([
          widget.myRepository.getAllCategoryProducts(id: widget.category.id),
          widget.myRepository.getAllCategoryProducts(id: widget.category.id)
        ]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            List<ProductItem> data = snapshot.data[1]! as List<ProductItem>;
            return GridView.count(
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 0.6,
              children: List.generate(
                  data.length, (index) {
                var item = data[index];
                return ProductsItemView(
                  item: item,
                  onTap: () => addToBasket(item),
                );
              }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<void> addToBasket(ProductItem item) async {
    bool onSaved = false;
    int savedId = 0;
    int ElementCount = 0;
    List<CachedProduct> savedProducts =
    await widget.myRepository.getAllCachedProducts();
    for (var element in savedProducts) {
      if (element.productId == item.id) {
        onSaved = true;
        savedId = element.id!;
        ElementCount = element.count;
      }
    }
    if (onSaved) {
      ElementCount += 1;
      await widget.myRepository.updateCachedProductById(
        id: savedId,
        cachedProduct: CachedProduct(
          imageUrl: item.imageUrl,
          price: item.price,
          count: ElementCount,
          name: item.name,
          productId: item.id,
        ),
      );
    } else {
      widget.myRepository.insertCachedProduct(
        cachedProduct: CachedProduct(
          imageUrl: item.imageUrl,
          price: item.price,
          count: 1,
          name: item.name,
          productId: item.id,
        ),
      );
    }
    MyFunctions.getMyToast(
      message: "Mahsulot savatga muvaffaqqiyatli qo'shildi!",
    );
  }
}


