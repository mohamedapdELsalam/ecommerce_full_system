import 'package:flutter/material.dart';

class CartCounterAndTotal extends StatelessWidget {
  const CartCounterAndTotal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        color: const Color.fromARGB(234, 0, 0, 0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            highlightColor: const Color.fromARGB(55, 76, 175, 79),
            icon: Icon(
              Icons.add,
              size: 15,
            ),
            onPressed: () {},
          ),
          Text(
            "2",
            style: TextStyle(fontSize: 10),
          ),
          IconButton(
            highlightColor: const Color.fromARGB(55, 175, 76, 76),
            icon: Icon(
              Icons.remove,
              size: 15,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
