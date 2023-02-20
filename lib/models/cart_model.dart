import 'item_model.dart';

class CartData {
  final int count;
  final ProductData product;
  final int id;
  CartData({required this.id, required this.count, required this.product});
}
