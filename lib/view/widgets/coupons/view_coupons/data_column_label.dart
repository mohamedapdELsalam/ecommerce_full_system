import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DataColumnLabel extends StatelessWidget {
  final String title;
  const DataColumnLabel({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.width / 5,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
