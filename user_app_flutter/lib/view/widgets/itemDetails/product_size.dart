import 'package:flutter/material.dart';

class ProductSize extends StatelessWidget {
  final String size;
  final bool isSelected;
  const ProductSize({
    required this.size,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 10, right: 10),
        height: 25,
        width: 40,
        decoration: BoxDecoration(
            boxShadow: isSelected
                ? [
                    BoxShadow(blurRadius: 2),
                  ]
                : [],
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
            child: Text(
          size,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Colors.black),
        )),
      ),
    );
  }
}
