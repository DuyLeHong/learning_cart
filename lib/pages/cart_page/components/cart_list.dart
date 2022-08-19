import 'package:flutter/material.dart';
import 'package:learning_cart/pages/cart_page/components/cart_item/cart_item.dart';
import 'package:learning_cart/pages/cart_page/data/cart_state.dart';

class CartList extends StatelessWidget {
  // chứa danh sách sản phẩm với số lượng từng sản phầm

  final Function(int) onDeleteCartItemClicked;
  final Function(int) onPlusCartItemClicked;
  final Function(int) onMinusCartItemClicked;

  const CartList({
    Key? key,
    required this.onDeleteCartItemClicked,
    required this.onPlusCartItemClicked,
    required this.onMinusCartItemClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartState.productList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final cartItem = cartState.productList.elementAt(index);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CartItem(
            itemName: cartItem.product.name,
            imageUrl: cartItem.product.image,
            itemCount: cartItem.count,
            price: cartItem.product.price,
            onPressedDeleteButton: () {
              onDeleteCartItemClicked(index);
              // caapj nhajt gía trị trong state -> xóa sản phẩm khỏi giỏ  hàng
              // cartState.productList.remove(cartItem);
              // đưa state lên UI
            },
            onMinusPressed: () {
              onMinusCartItemClicked(index);
              // // Thay đổi giá trị trong state
              // cartItem.count--;
              // cartItemList.add(cartItem);
              //
              // // đưa state mới lên UI
              // setState(() {});
            },
            onPlusPressed: () {
              onPlusCartItemClicked(index);
              // // Thay đổi giá trị trong state
              // cartItem.count++;
              // cartItemList.add(cartItem);
              //
              // // đưa state mới lên UI
              // setState(() {});
            },
          ),
        );
      },
    );
  }
}
