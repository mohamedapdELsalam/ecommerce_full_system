import 'package:flutter/widgets.dart';

class DataCellChild extends StatelessWidget {
  final String text;
  const DataCellChild({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
