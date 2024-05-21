import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  // Defining a Function that takes an integer as an argument
  final Function(int) onTap;
  // Defining an integer variable named SelectedItem
  final int SelectedItem;

  // Constructor for BottomNavBar, taking onTap and SelectedItem as required parameters
  const BottomNavBar({Key? key, required this.onTap, required this.SelectedItem}) : super(key: key);
  // Overriding the createState method to return an instance of _BottomNavBarState
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

// Defining a State class named _BottomNavBarState that extends the State of BottomNavBar
class _BottomNavBarState extends State<BottomNavBar> {
  @override
  // Overriding the build method to return a widget tree
  Widget build(BuildContext context) {
    // Getting the height and width of the current screen
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Container(
      // Setting the color of the Container
      color: Colors.grey[100],
      // Adding a Padding widget as a child of the Container
      child: Padding(
        // Setting the padding of the Padding widget
        padding: EdgeInsets.symmetric(horizontal: w * .015, vertical: h * .01),
        // Adding a GNav widget as a child of the Padding widget
        child: GNav(
          // Setting the gap between the GNav items
          gap: 10,
          tabBorderRadius: 100,
          backgroundColor: Colors.grey[100]!,
          activeColor: Colors.white,
          color: Color.fromARGB(255, 203, 125, 56),
          tabBackgroundGradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 203, 125, 56),
              Color.fromARGB(255, 203, 125, 56)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          iconSize: 30,
          textSize: 18,
          padding: EdgeInsets.symmetric(horizontal: w*.01, vertical: h*.01),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.category,
              text: 'Categories',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.bookmark,
              text: 'Saved',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Shopping',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
        onTabChange: widget.onTap,
          selectedIndex: 0,
        )),
      );
  }
}

/*

+--------------------+
| BottomNavBar       |
|--------------------|
| - onTap: Function  |
| - SelectedItem: int|
|--------------------|
| + BottomNavBar(...)|
| + createState():   |
|   State<BottomNavBar>|
+--------------------+
          |
          v
+--------------------+
| _BottomNavBarState |
|--------------------|
| + build(context:   |
|   BuildContext):   |
|   Widget           |
+--------------------+
*/
