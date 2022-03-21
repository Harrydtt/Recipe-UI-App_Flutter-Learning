import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({required this.recipeModel});

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SlidingUpPanel(
          minHeight: size.height * 0.5,
          maxHeight: size.height / 1.2,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          parallaxEnabled: true,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: recipeModel.imgPath,
                    child: Image(
                      height: (size.height * 0.5) + 50,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage(recipeModel.imgPath),
                    ),
                  ),
                ),
                const Positioned(
                    top: 60,
                    right: 20,
                    child: Icon(
                      Icons.bookmark_add_outlined,
                      color: Colors.white,
                      size: 30,
                    )),
                Positioned(
                    top: 60,
                    left: 20,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        CupertinoIcons.back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ))
              ],
            ),
          ),
          panel: Padding(
            padding: const EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                recipeModel.title,
                style: _textTheme.headline6,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                recipeModel.writer,
                style: _textTheme.caption,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.favorite_sharp,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("198"),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.timer,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(recipeModel.cookingTime.toString() + "\'"),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    color: Colors.black,
                    height: 30,
                    width: 2,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(recipeModel.servings.toString() + " Servings"),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black.withOpacity(0.3),
              ),
              Expanded(
                  child: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                        labelStyle: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                        unselectedLabelColor: Colors.black.withOpacity(0.3),
                        // labelPadding: const EdgeInsets.symmetric(horizontal: 2),
                        labelColor: Colors.black,
                        indicator: DotIndicator(
                            color: Colors.red,
                            distanceFromCenter: 16,
                            radius: 3,
                            paintingStyle: PaintingStyle.fill),
                        tabs: [
                          Tab(
                            child: Text("Ingredients".toUpperCase()),
                          ),
                          Tab(
                            child: Text("Preparation".toUpperCase()),
                          ),
                          Tab(
                            child: Text("Reviews".toUpperCase()),
                          ),
                        ]),
                    Divider(
                      color: Colors.black.withOpacity(0.3),
                    ),
                    Expanded(
                        child: TabBarView(
                      children: [
                        Ingredients(
                          recipeModel: recipeModel,
                        ),
                        Container(
                          child: Text("Preparation"),
                        ),
                        Container(
                          child: Text("Reviews"),
                        )
                      ],
                    ))
                  ],
                ),
              ))
            ]),
          )),
    );
  }
}

class Ingredients extends StatelessWidget {
  final RecipeModel recipeModel;
  const Ingredients({
    required this.recipeModel,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ListView.separated(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: recipeModel.ingredients.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.black.withOpacity(0.3),
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text('🍳 ' + recipeModel.ingredients[index]),
            );
          },
        )
      ]),
    );
  }
}
