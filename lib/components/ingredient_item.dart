import 'package:flutter/material.dart';
import 'package:google_drive_bottom_navi/main.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IngredientItem extends StatelessWidget{
  final String quantity,measure,food,imageUrl;
  const IngredientItem({super.key, required this.quantity,
  required this.measure,
  required this.food,
  required this.imageUrl});

  @override 
  Widget build(BuildContext context){
      final h = MediaQuery.of(context).size.height;
      final w = MediaQuery.of(context).size.width;
      var myBox=Hive.box('shopping');
      return Container(
        margin: EdgeInsets.symmetric(vertical: h*.01, horizontal: w*.033),
        padding: EdgeInsets.only(
          top: h*.008,
          left: h*.008,
          right: w*.08,
          bottom: h*.008,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(imageUrl, width: w*.2, height: h*.1, fit: BoxFit.cover),
        ),
        Text("$food\n$quantity $measure", style: TextStyle(
          fontSize: w*.04, fontWeight: FontWeight.bold, letterSpacing: 1
        ),),
        SizedBox(width: w*.033,),
        ValueListenableBuilder(
          valueListenable: myBox.listenable(),
          builder: (context, box, _){
            bool exist = box.containsKey(food);
            if(exist){
              return GestureDetector(
                onTap: (){
                  myBox.delete(food);
                  ScaffoldMessenger.of(context).showSnackBar(
                   const SnackBar(content: Text('item deleted'))
                  );
                },
                child: Icon(Icons.delete, color: Colors.redAccent, size: w*.08,),
              );
            }
            else{
              return GestureDetector(
                onTap: (){
                  myBox.put(food, {'quantity': quantity, 'measure': measure, 'imageUrl': imageUrl});
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('item added'))
                  );
                },
                child: Icon(Icons.add_circle_outline, color: Colors.redAccent, size: w*.08,),
              );
            }
          },
        )
      ],
    ),
    );
  }
}

/*
---------------------------------------
|           IngredientItem             |
---------------------------------------
| -quantity: String                    |
| -measure: String                     |
| -food: String                        |
| -imageUrl: String                    |
---------------------------------------
| +IngredientItem({                    |
|   key,                               |
|   required quantity,                 |
|   required measure,                  |
|   required food,                     |
|   required imageUrl                  |
| })                                  |
| +build(BuildContext): Widget         |
---------------------------------------
*/
