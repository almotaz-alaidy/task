import 'package:flutter/material.dart';

import 'image.dart';

class Poster extends StatefulWidget {
  final List topMovie;
  final int index;
  const Poster({super.key, required this.topMovie, required this.index});

  @override
  State<Poster> createState() => _PosterState();
}

class _PosterState extends State<Poster> {
  // List overViwe = widget.topMovie[widget.index]['overview'];

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
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return ImageOriginal(
                      movieImage: NetworkImage(
                          "https://image.tmdb.org/t/p/original${widget.topMovie[widget.index]['poster_path']}"));
                })));
              },
              child: Image(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/original${widget.topMovie[widget.index]['poster_path']}")),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.topMovie[widget.index]["overview"],
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
