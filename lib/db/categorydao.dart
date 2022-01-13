import 'package:film_app_sqlite/db/dbhelper.dart';
import 'package:film_app_sqlite/model/category.dart';
import 'package:film_app_sqlite/model/film.dart';

class Categorydao {
  Future<List<Category>> getCategories() async {
    var db = await DbHelper.getAccess();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM kategoriler");
    return List.generate(maps.length, (i) {
      var line = maps[i];

      return Category(line["kategori_id"], line["kategori_ad"]);
    });
  }
}
