import 'package:flutter/material.dart';
import 'package:learning_cart/pages/cart_page/components/cart_list.dart';
import 'package:learning_cart/pages/cart_page/components/checkout_panel.dart';
import 'package:learning_cart/pages/cart_page/data/cart_state.dart';

import 'data/models/cart_item_model.dart';
import 'data/models/product.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      cartState.productList.add(
        CartItemModel(
          product: Product(
            name: 'Túi da ${i + 1}',
            image:
                "https://i0.wp.com/www.giztechreview.com/wp-content/uploads/2021/10/Intel-12th-Generation-Core-i9-12900K-Processor-Unboxing-9.jpg",
            price: 200,
          ),
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: false,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            CartList(
              onPlusCartItemClicked: (index) {
                cartState.productList.elementAt(index).count++;
                setState(() {});
              },
              onMinusCartItemClicked: (index) {
                cartState.productList.elementAt(index).count--;
                setState(() {});
              },
              onDeleteCartItemClicked: (index) {
                final cartItem = cartState.productList.elementAt(index);
                cartState.productList.remove(cartItem);
                setState(() {});
              },
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
      bottomNavigationBar: CheckOutPanel(
        onPressedCheckOutButton: () {
          // quay lại màn truóc đó
          // trả về kết quả thanh toán thành công hay thất bại
          Navigator.of(context).pop(true);
        },
      ),
    );
  }
}
