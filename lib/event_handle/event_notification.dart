import 'package:flutter/material.dart';

class EventNotification extends StatefulWidget {
  @override
  _EventNotificationState createState() => _EventNotificationState();
}

class _EventNotificationState extends State<EventNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollStartNotification) {
            print("scroll start");
          } else if (notification is ScrollUpdateNotification) {
            print("scrolling");
          } else {
            print("scroll end");
          }
        },
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Text("position ${position}");
          },
          itemCount: 50,
        ),
      ),
    );
  }
}
