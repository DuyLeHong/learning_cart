import 'product.dart';

class CartItemModel {
  int count;
  final Product product;
  double get subTotal => product.price * count;

  CartItemModel({
    required this.product,
    this.count = 1,
  });
}
