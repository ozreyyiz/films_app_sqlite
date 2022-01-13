import 'package:film_app_sqlite/db/dbhelper.dart';
import 'package:film_app_sqlite/model/category.dart';
import 'package:film_app_sqlite/model/director.dart';
import 'package:film_app_sqlite/model/film.dart';

class Filmlerdao {
  Future<List<Film>> getFilmswithCategoryId(int category_id) async {
    var db = await DbHelper.getAccess();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM filmler,kategoriler,yonetmenler WHERE filmler.kategori_id=kategoriler.kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen_id and filmler.kategori_id=$category_id");

        return List.generate(maps.length, (i){
var line=maps[i];

var c=Category(line["kategori_id"],line["kategori_ad"]);
var d=Director(line["yonetmen_id"],line["yonetmen_ad"]);
return Film(line["film_id"], line["film_ad"], line["film_yil"], line["film_resim"], c, d);

        });
  }
}
