import 'package:flutter/material.dart';

class ProductSize extends StatelessWidget {
  final String size;
  const ProductSize({
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 10, right: 10),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 1),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
            child: Text(
          size,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.blue),
        )),
      ),
    );
  }
}
