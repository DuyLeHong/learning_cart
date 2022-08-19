import 'package:flutter/material.dart';
import 'package:learning_cart/pages/cart_page/components/cart_item/components/cart_item_price_detail.dart';
import 'package:learning_cart/pages/cart_page/components/cart_item/components/cart_item_titled.dart';
import 'package:learning_cart/pages/cart_page/components/cart_item/components/cart_items_counter.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.itemName,
    required this.imageUrl,
    required this.price,
    this.itemCount = 1,
    this.onPressedDeleteButton,
    required this.onPlusPressed,
    required this.onMinusPressed,
  }) : super(key: key);

  // phần giống/ chung về layout (loại widget, khoảng cách giữa widget, thứ tự sắp xếp...)
  // mình để bên trong
  // khác nhau -> đưa ra ngoài bằng tham số trên constructor: data, cum wwidget khac nhau
  final String itemName;
  final String
      imageUrl; // chỉ đưa widget ra ngoài, khi mình cần loại widget khác nhau
  final double price;
  final int itemCount;
  final Function()? onPressedDeleteButton;
  final VoidCallback onPlusPressed;
  final VoidCallback onMinusPressed;

  @override
  Widget build(BuildContext context) {
    double subTotal = price * itemCount;
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        margin: const EdgeInsets.only(bottom: 3.0, right: 3.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 3.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 155,
              height: 140,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CartItemTitled(
                    itemName: itemName,
                    onPressedDeleteButton: onPressedDeleteButton,
                  ),
                  CartItemPriceDetail(
                    price: price,
                    subTotal: subTotal,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ships Free',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 18,
                        ),
                      ),
                      CartItemsCounter(
                        itemCount: itemCount,
                        onMinusPressed: onMinusPressed,
                        onPlusPressed: onPlusPressed,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
