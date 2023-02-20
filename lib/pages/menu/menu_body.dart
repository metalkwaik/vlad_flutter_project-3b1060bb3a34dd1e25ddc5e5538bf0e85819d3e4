import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item_model.dart';
import 'package:provider/provider.dart';
import '../cart/cart_controlle/cart_controller.dart';
import 'menu_controller/menu_controller.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MenuControll>();
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.productData?.length ?? 0,
          itemBuilder: (_, int index) => Column(
            children: [
              _ItemBuilder(index: index),
              const Divider(color: Colors.grey, height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
const h = 90.0;
class _ItemBuilder extends StatelessWidget {
  final int index;
  const _ItemBuilder({required this.index});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MenuControll>();


    Widget itemImg() {
      return ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: h,
          maxWidth: h * 1.5,
        ),
        child: Image(
          fit: BoxFit.cover,
          image: NetworkImage(controller.productData![index].img!),
        ),
      );
    }

    Widget itemInfo() {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                controller.productData![index].name ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 9),
              Text(controller.productData![index].description ?? ''),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        const SizedBox(height: 9),
        Row(children: [
          itemImg(),
          itemInfo(),
        ]),
        _UpDataItem(
          index: index,
          item: controller.productData![index],
        ),
      ],
    );
  }
}

class _UpDataItem extends StatelessWidget {
  final int index;
  final ProductData item;
  const _UpDataItem({required this.index, required this.item});
  @override
  Widget build(BuildContext context) {
    final cardController = context.watch<CartController>();
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Text(
            'цена ${item.price}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => cardController.upDataCountProductInCart(false, item),
            child: const Icon(
              Icons.remove,
            ),
          ),
          const SizedBox(width: 9),
          Text(cardController.getCountProduct(item)),
          const SizedBox(width: 9),
          GestureDetector(
            onTap: () => cardController.upDataCountProductInCart(true, item),
            child: const Icon(
              Icons.add,
            ),
          ),
        ],

      ),
    );
  }
}
