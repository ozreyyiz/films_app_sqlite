import 'package:film_app_sqlite/db/filmlerdao.dart';
import 'package:film_app_sqlite/model/category.dart';
import 'package:film_app_sqlite/model/director.dart';
import 'package:film_app_sqlite/model/film.dart';
import 'package:film_app_sqlite/pages/detail_page.dart';
import 'package:flutter/material.dart';

class FilmPage extends StatefulWidget {
  Category category;
  FilmPage({required this.category});

  @override
  _FilmPageState createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  List<Film> films = [];

  Future<List<Film>> getFilm(int category_id) async {
films= await Filmlerdao().getFilmswithCategoryId(category_id);

    return films;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Film Page"),
      ),
      body: FutureBuilder(
        future: getFilm(widget.category.category_id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var filmList = snapshot.data;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemCount: films.length,
              itemBuilder: (BuildContext context, int index) {
                Film film = filmList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  film: film,
                                )));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset("assets/${film.film_photo}"),
                        Text(film.film_name),
                        Text(film.director.director_name),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
