import 'package:flutter/material.dart';
import 'package:google_drive_bottom_navi/main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipeapps/components/custom_app_bar.dart';

class SavedScreen extends StatelessWidget { 
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    var myBox=Hive.box('saved');
    return Scaffold( 
      appBar: const CustomAppBar(title: 'Saved', back: false),
      body: Padding(padding:const EdgeInsets.only(top: 10, right: 8, left: 8),
      child: ValueListenableBuilder( 
        valueListenable: myBox.listenable(),
        builder: (context, box, _){ 
          return ListView.builder( 
            itemCount: box.length,
            itemBuilder: (context, index){ 
              var data = box.values.toList();
              return ListTile( 
                title: Container ( 
                   
                  height: h*.085,
                  color: Colors.grey[100],
                  child: Row( 
                    children: [ 
                      Expanded(
                        flex: 3,
                        child: Text(data[index])),
                        PopupMenuButton(itemBuilder: (context){ 
                          return const [ 
                            PopupMenuItem( 
                              value: 'share',
                              child: Text('share'),
                            ),
                            PopupMenuItem( 
                              value: 'delete',
                              child: Text('delete'),
                            ),
                          ];
                        }
                  )
                  ],
                ),
                ),
              );

            },
          );
        }
      ))
    );
  }
}