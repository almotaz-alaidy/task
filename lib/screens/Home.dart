import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'Poster.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List topMovie = [];
  final String _APIKey = '6f96915b460685633d6a527f32d4040a';
  final String _readAccessTokin =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2Zjk2OTE1YjQ2MDY4NTYzM2Q2YTUyN2YzMmQ0MDQwYSIsInN1YiI6IjYzYTFmNGRiYmU2ZDg4MDBiY2E5NDkxMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vhDNNP3Bj5hgn7srofdkzvPkogmXvQqz_9kO0NXjHHo";

  @override
  void initState() {
    // TODO: implement initState
    LoedMovie();

    super.initState();
  }

  LoedMovie() async {
    TMDB _get_data = TMDB(ApiKeys(_APIKey, _readAccessTokin),
        logConfig: const ConfigLogger(showErrorLogs: true, showLogs: true));
    for (int i = 1; i <= 500; i++) {
      Map _Movies = await _get_data.v3.movies.getTopRated(page: i);
      setState(() {
        topMovie = topMovie + _Movies['results'];
        // print(_Movies);
      });
    }
    print(topMovie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: topMovie.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Poster(index: index, topMovie: topMovie);
              }));
            }),
            child: ListTile(title: Text(topMovie[index]['title'])),
          );
        },
      ),
    );
  }
}
