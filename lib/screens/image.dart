import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class ImageOriginal extends StatefulWidget {
  final NetworkImage movieImage;

  const ImageOriginal({super.key, required this.movieImage});

  @override
  State<ImageOriginal> createState() => _ImageOriginalState();
}

class _ImageOriginalState extends State<ImageOriginal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Image(image: widget.movieImage),
            IconButton(
                onPressed: () async {
                  GallerySaver.saveImage(widget.movieImage.url);
                },
                icon: const Icon(Icons.download)),
          ],
        ),
      ),
    );
  }
}
