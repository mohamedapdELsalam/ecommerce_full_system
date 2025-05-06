import 'dart:io';

import 'package:flutter/material.dart';

class ImageFullScreen extends StatelessWidget {
  final String path;
  final bool network;
  const ImageFullScreen({super.key, required this.path, required this.network});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          child:
              network
                  ? Image.network(path, fit: BoxFit.contain)
                  : Image.file(File(path)),
        ),
      ),
    );
  }
}
