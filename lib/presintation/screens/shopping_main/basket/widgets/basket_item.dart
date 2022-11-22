import 'package:flutter/material.dart';
import '../../../../../data/local_database/db/cached_product.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/styles.dart';
class BasketItem extends StatelessWidget {
  const BasketItem(
      {Key? key, required this.cachedProduct, required this.onItemTap})
      : super(key: key);

  final CachedProduct cachedProduct;
  final VoidCallback onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cachedProduct.name),
      subtitle: Text(
        "Mahsulotlar soni:  ${cachedProduct.count} x ${cachedProduct.price}",
        style: MyTextStyle.interMedium500.copyWith(color: MyColors.C_4047C1),
      ),
      trailing: SizedBox(
        width: 115,
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(cachedProduct.imageUrl),
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: onItemTap,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
