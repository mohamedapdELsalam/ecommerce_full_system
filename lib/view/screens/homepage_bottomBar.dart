import 'package:flutter/material.dart';

class HomePageBottomBar extends StatelessWidget {
  const HomePageBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopify_rounded), label: "shop"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "favorite"),
      ],
    );
  }
}
