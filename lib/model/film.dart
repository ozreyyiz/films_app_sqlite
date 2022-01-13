import 'package:film_app_sqlite/model/category.dart';
import 'package:film_app_sqlite/model/director.dart';

class Film {
  final int film_id;
  final String film_name;
  final int film_year;
  final String film_photo;
  final Category category;
  final Director director;

  Film(this.film_id, this.film_name, this.film_year, this.film_photo, this.category, this.director);
}