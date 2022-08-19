import 'package:learning_cart/pages/cart_page/data/models/cart_item_model.dart';

class CartState {
  final Set<CartItemModel> productList;

  double get totalPrice {
    // for theo phần tử
    var result = 0.0;
    for (var cartItem in productList) {
      result += cartItem.subTotal;
    }
    return result;
  }

  CartState({required this.productList});
}

final cartState = CartState(productList: <CartItemModel>{});
