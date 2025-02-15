import 'package:flutter/material.dart';

class CartTitleAndPrice extends StatelessWidget {
  const CartTitleAndPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "elahly club t- shirt",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          Text("200 \$", style: Theme.of(context).textTheme.titleSmall!),
        ],
      ),
    );
  }
}
