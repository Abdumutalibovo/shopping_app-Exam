import 'package:flutter/material.dart';
import '../../../../data/models/main/products_item.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/styles.dart';

class ProductsItemView extends StatelessWidget {
  final ProductItem item;
  final VoidCallback onTap;

  const ProductsItemView(
      {Key? key,
        required this.item,
        required this.onTap,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey),
          boxShadow: [
            BoxShadow(
                spreadRadius: 8,
                blurRadius: 5,
                offset: const Offset(1, 3),
                color: Colors.grey.shade300)
          ]),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            child: Text(
              item.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: MyStyle.interBold700.copyWith(
                fontSize: 16,
                color: MyColors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "USD ${item.price}",
            style: MyStyle.interSemiBold600.copyWith(
              fontSize: 18,
              color: MyColors.C_4047C1,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              backgroundColor: MyColors.black,
            ),
            child: Text(
              "Savatga qo'shish",
              style: MyStyle.interMedium500.copyWith(
                color: MyColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
