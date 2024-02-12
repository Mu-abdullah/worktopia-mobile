import 'package:flutter/material.dart';

class ImagePreviewScreen extends StatelessWidget {
  const ImagePreviewScreen({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: InteractiveViewer(
      panEnabled: false,
      boundaryMargin: const EdgeInsets.all(20.0),
      maxScale: 4.0,
      child: Hero(
        tag: "imageHero",
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    ));
  }
}
