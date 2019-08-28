import 'package:flutter/material.dart';
import 'package:study_flutter_app/page/ssq_page.dart';
import 'package:study_flutter_app/provider/ssq_list_num.dart';

import 'animation/curve_animation.dart';
import 'animation/tween_animation.dart';
import 'base_widget/drawer_widget.dart';
import 'base_widget/listview_widget.dart';
import 'event_handle/event_notification.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String mainProfilePicture =
      "http://wd-hdds-test.oss-cn-beijing.aliyuncs.com//res/qd/input/9f/149f22c2-eb7c-40d6-9654-7bb8c84fb3ba.jpg";
  String otherProfilePicture =
      "http://wd-hdds-test.oss-cn-beijing.aliyuncs.com//res/qd/input/9f/149f22c2-eb7c-40d6-9654-7bb8c84fb3ba.jpg";
  String image =
      "http://wd-hdds-test.oss-cn-beijing.aliyuncs.com//res/qd/input/9f/149f22c2-eb7c-40d6-9654-7bb8c84fb3ba.jpg";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(builder: (_) => ListNum()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          key: _scaffoldKey,
          drawer: DrawerWidget(
            accountName: "dzh",
            accountEmail: "duzh@wdcloud.cc",
            image: image,
            otherAccountsPicture: otherProfilePicture,
            currentAccountPicture: mainProfilePicture,
          ),
          appBar: AppBar(
            title: Text('标题'),
            leading: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                }),
          ),
//        body: TextWidget(title: "这是一个TextWidget"),
//        body: ContainerWidget(),
          body: Image.network(mainProfilePicture,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                    child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                        : null));
              }
            },),
        ),
      ),
    );
  }
}
