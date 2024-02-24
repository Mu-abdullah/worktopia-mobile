import 'package:flutter/material.dart';
import 'package:worktopia/core/widgets/default_texts.dart';

class ImagePreviewScreen extends StatelessWidget {
  const ImagePreviewScreen(
      {super.key, required this.imageUrl, required this.imageTitle});
  final String imageUrl;
  final String imageTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleText(text: imageTitle),
      ),
      body: Center(
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
      )),
    );
  }
}
