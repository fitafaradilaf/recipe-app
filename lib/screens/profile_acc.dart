import 'package:flutter/material.dart';


class ProfileAccount extends StatelessWidget {
  ProfileAccount({super.key});

  @override
  List<Icon> icons = [
    Icon(Icons.person, color: Color(0xfff96163)),
    Icon(Icons.settings, color: Color(0xfff96163)),
    Icon(Icons.note_add, color: Color(0xfff96163)),
    Icon(Icons.favorite, color: Color(0xfff96163)),
    Icon(Icons.chat, color: Color(0xfff96163)),
    Icon(Icons.login, color: Color(0xfff96163)),
  ];
  List titls = [
    'Perconal data',
    'Settings',
    'E-Statement',
    'Refferal Code',
    'FAQs',
    'Logout'
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f4fa),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xfff96163), width: 2),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/pp.png'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Charlotte',
            style: TextStyle(fontSize: 18, color: Color(0xfff3C444C), fontFamily: 'ro'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              height: 40,
              thickness: 2,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Container(
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: icons[index],
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    titls[index],
                    style: TextStyle(fontSize: 17, color: Color(0xfff3C444C)),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 15,
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}