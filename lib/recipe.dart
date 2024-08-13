import 'package:flutter/material.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecipeList(),
    );
  }
}

class Recipe {
  final String name;
  final String imageUrl;

  Recipe({required this.name, required this.imageUrl});
}

class RecipeList extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(name : 'Nasi Goreng', imageUrl: 'assets/images/nasgor.jpg'),
    Recipe(name : 'Indomie Rebus', imageUrl: 'assets/images/mirebus.jpg'),
    Recipe(name : 'Ayam Goreng', imageUrl: 'assets/images/ayam.jpg'),
    Recipe(name : 'Ikan Bakar', imageUrl: 'assets/images/ikan.jpeg'),
    Recipe(name : 'Sayur Asem', imageUrl: 'assets/images/sayur.jpg'),
    Recipe(name : 'Rendang', imageUrl: 'assets/images/rendang.jpg'),
  ];

   RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Resep', style: TextStyle(fontSize: 18.0),),
      ),

      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
          child: ListTile(
            leading: Image.asset(recipes[index].imageUrl),
              title: Text(recipes[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(recipe: recipes[index].name),
                ),);
            },
              ),
          );

        },
      ),

    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final String recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe),
      ),
      body: Center(
        child: Text('Recipe details for $recipe'),
      ),
    );
  }
}
