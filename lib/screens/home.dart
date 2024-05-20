import 'package:flutter/material.dart';
import 'package:recipeapps/components/bottom_nav_bar.dart';
import 'package:recipeapps/screens/home_screen.dart';
import 'package:recipeapps/screens/recipe_category.dart';
import 'package:recipeapps/screens/saved_screen.dart';
import 'package:recipeapps/screens/search_screen.dart';
import 'package:recipeapps/screens/shopping_screen.dart';
import 'package:recipeapps/screens/profile_acc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }
  
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
          setState(() {
            currentIndex = index;
          });
        },
        SelectedItem: currentIndex,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
          children: [
            HomePage(),
            RecipeCategory(),
            SearchScreen(),
            SavedScreen(),
            const ShoppingScreen(),
            ProfileAccount(),
          ],
      ),
    );
  }
}