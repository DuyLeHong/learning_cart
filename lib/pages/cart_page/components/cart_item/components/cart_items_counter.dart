import 'package:flutter/material.dart';

class CartItemsCounter extends StatelessWidget {
  const CartItemsCounter(
      {Key? key,
      this.itemCount = 1,
      required this.onPlusPressed,
      required this.onMinusPressed})
      : super(key: key);

  final int itemCount;
  final VoidCallback onPlusPressed;
  final VoidCallback onMinusPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onMinusPressed,
          icon: const Icon(
            Icons.remove,
            color: Colors.red,
          ),
        ),
        Card(
          elevation: 2.5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(itemCount.toString()),
          ),
        ),
        IconButton(
          onPressed: () {
            onPlusPressed();
          },
          icon: const Icon(
            Icons.add,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
