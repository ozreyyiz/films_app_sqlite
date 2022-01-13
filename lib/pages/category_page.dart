import 'package:film_app_sqlite/db/categorydao.dart';
import 'package:film_app_sqlite/model/category.dart';
import 'package:film_app_sqlite/pages/film_page.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Category> categories = [];

  Future<List<Category>> getCategory() async {
    categories=await Categorydao().getCategories();
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: FutureBuilder(
        future: getCategory(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              var category = categories[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilmPage(
                                category: category,
                              )));
                },
                child: SizedBox(
                  height: 50,
                  child: Card(
                    child: Center(
                      child: Text(category.category_name),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
