import 'package:film_app_sqlite/model/film.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  Film film;
  DetailPage({required this.film});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.film_name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/${widget.film.film_photo}"),
            Text(widget.film.film_name),
            Text(widget.film.director.director_name),
          ],
        ),
      ),
    );
  }
}
