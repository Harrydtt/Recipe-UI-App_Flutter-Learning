import 'package:flutter/material.dart';
import 'package:recipe_app/new_recipe.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        // color: Colors.grey[300],
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              Icons.home,
              color: Colors.blue,
            ),
            Icon(
              Icons.group,
              color: Colors.blue,
            ),
            Icon(
              Icons.favorite,
              color: Colors.blue,
            ),
            Icon(
              Icons.account_circle,
              color: Colors.blue,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),
              TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: 'New Recipes'.toUpperCase()),
                  Tab(text: 'Favorites'.toUpperCase()),
                  Tab(text: 'Categories'.toUpperCase()),
                ],
                labelColor: Colors.black,
                indicator: DotIndicator(
                    color: Colors.black,
                    distanceFromCenter: 16,
                    radius: 3,
                    paintingStyle: PaintingStyle.fill),
                unselectedLabelColor: Colors.black.withOpacity(0.3),
                labelPadding: const EdgeInsets.symmetric(horizontal: 24),
              ),
              const Expanded(
                  child: TabBarView(children: [
                NewRecipe(),
                Center(child: Text("New Recipes")),
                Center(child: Text("New Recipes"))
              ]))
            ])),
      ),
    );
  }
}
