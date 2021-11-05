import 'dart:math';
import 'package:classage/library/tests/category.dart';
import 'package:classage/library/tests/quiz_options.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {

  List _color = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.lightBlue,
    Colors.amber,
    Colors.deepOrange,
    Colors.green,
    Colors.brown
  ];
  Random random = new Random();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('tests'),
          elevation: 0,
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: Text(
                        "Select a category & start the quiz",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: MediaQuery.of(context).size.width >
                                    1000
                                ? 7
                                : MediaQuery.of(context).size.width > 600 ? 5 : 3,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0),
                        delegate: SliverChildBuilderDelegate(
                          _buildCategoryItem,
                          childCount: categories.length,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    Category category = categories[index];
    return ElevatedButton(
      onPressed: () => _categoryPressed(context, category),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        primary: _color[index],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (category.icon != null) Icon(category.icon, color: Colors.white,),
          if (category.icon != null) SizedBox(height: 10.0),
          Text(category.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }

  _categoryPressed(BuildContext context, Category category) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => BottomSheet(
        builder: (_) => QuizOptionsDialog(
          category: category,
        ),
        onClosing: () {},
      ),
    );
  }
}
