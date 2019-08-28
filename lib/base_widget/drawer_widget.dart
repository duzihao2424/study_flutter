import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final String accountName;
  final String accountEmail;
  final String image;
  final String currentAccountPicture;
  final String otherAccountsPicture;

//  final List<Map> list;

  DrawerWidget(
      {Key key,
      this.accountName,
      this.accountEmail,
      this.image,
      this.otherAccountsPicture,
      this.currentAccountPicture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(accountName),
            accountEmail: Text(accountEmail),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundImage: NetworkImage(currentAccountPicture),
              ),
            ),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: NetworkImage(otherAccountsPicture),
                ),
              )
            ],
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
            ),
          ),
          ListTile(
            title: Text("title1"),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: Text("title2"),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: Text("title3"),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
        ],
      ),
    );
  }

//  List<Widget> getItem(context) {
//    return list.map((map) {
//      return ListTile(
//        title: Text(map['title']),
//        trailing: map['trailing'],
//        onTap: () {
//          if (map['native'] == 0) {
//            print('click 0');
//          } else {
//            print('click other');
//          }
//        },
//      );
//    }).toList();
//  }
}
