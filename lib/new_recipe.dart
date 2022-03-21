import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/recipe_details.dart';

class NewRecipe extends StatelessWidget {
  const NewRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: RecipeModel.demoRecipe.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetails(
                        recipeModel: RecipeModel.demoRecipe[index],
                      ),
                    ),
                  ),
                  child: RecipeCard(
                    RecipeModel.demoRecipe[index],
                  ),
                ),
              );
            },
          )
        ],
      )),
    );
  }
}

class RecipeCard extends StatefulWidget {
  final RecipeModel recipeModel;
  RecipeCard(this.recipeModel);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool saved = false;
  bool loved = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Hero(
                  tag: widget.recipeModel.imgPath,
                  child: Image(
                    height: 320,
                    width: 320,
                    fit: BoxFit.cover,
                    image: AssetImage(widget.recipeModel.imgPath),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 20,
                right: 40,
                child: InkWell(
                    onTap: (() => setState(() {
                          saved = !saved;
                        })),
                    child: Icon(
                      saved
                          ? Icons.bookmark_add_sharp
                          : Icons.bookmark_add_outlined,
                      color: Colors.white,
                      size: 30,
                    )))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.recipeModel.title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.recipeModel.writer,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(Icons.timer_outlined),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(widget.recipeModel.cookingTime.toString() + "\'"),
                  const Spacer(),
                  InkWell(
                    onTap: () => setState(() {
                      loved = !loved;
                    }),
                    child: Icon(
                      Icons.favorite_sharp,
                      color: loved ? Colors.red : Colors.black,
                    ),
                  )
                ]),
              )
            ],
          ),
        )
      ],
    );
  }
}
