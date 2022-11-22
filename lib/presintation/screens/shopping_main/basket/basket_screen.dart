import 'package:flutter/material.dart';
import 'package:shopping_app_exam/presintation/screens/shopping_main/basket/widgets/basket_item.dart';
import '../../../../data/local_database/db/cached_product.dart';
import '../../../../data/my_repository.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/styles.dart';
import '../../../../utils/utility_functions.dart';
class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key, required this.myRepository}) : super(key: key);
  final MyRepository myRepository;

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Savatcha"),
        actions: [
          TextButton(
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                          "Rostdan ham savatchadi barcha mahsulotlarni o'chirmoqchimisiz?"),
                      actions: [
                        TextButton(
                          child: const Text('Xa'),
                          onPressed: () async {
                            await widget.myRepository.clearAllCachedProducts();
                            setState(() {});
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text("Yo'q"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
            },
            child: Text(
              "Tozalash",
              style: MyStyle.interSemiBold600.copyWith(
                color: MyColors.white,
              ),
            ),
          )
        ],
      ),
      body: FutureBuilder<List<CachedProduct>>(
        future: widget.myRepository.getAllCachedProducts(),
        builder: (BuildContext context,
            AsyncSnapshot<List<CachedProduct>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            List<CachedProduct> data = snapshot.data!;
            var totalPrice = data.isNotEmpty?data.map((e) => (e.price * e.count)).reduce(
                  (value, element) => value + element,
            ):0;
            return Column(
              children: [
                Expanded(
                    child: ListView(
                      children: List.generate(data.length, (index) {
                        var cachedItem = data[index];
                        return BasketItem(
                          cachedProduct: cachedItem,
                          onItemTap: () async {
                            await widget.myRepository.deleteCachedProductById(
                              id: cachedItem.id!,
                            );
                            MyFunctions.getMyToast(message: "O'chirildi!");
                            setState(() {});
                          },
                        );
                      }),
                    )),
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          spreadRadius: 7,
                          color: Colors.grey.shade300,
                          offset: const Offset(1, 4),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Umumiy summa  --->",
                        style: MyStyle.interSemiBold600.copyWith(
                          fontSize: 20,
                          color: MyColors.black,
                        ),
                      ),
                      Text(
                        "\$ $totalPrice",
                        style: MyStyle.interSemiBold600.copyWith(
                          fontSize: 20,
                          color: MyColors.C_4047C1,
                        ),
                      )
                    ],
                  ),
                )
              ],
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
}
