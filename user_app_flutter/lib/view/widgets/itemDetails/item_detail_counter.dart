import 'package:flutter/material.dart';

class ItemDetailsCounter extends StatelessWidget {
  const ItemDetailsCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 38,
        width: 125,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
            Text("3"),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {},
            ),
          ],
        ));
  }
}
