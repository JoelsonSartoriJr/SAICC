import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../app.dart';

class LocalNotification extends StatefulWidget {
  @override
  _LocalNotificationState createState() => _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {
  final notifications = FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    super.initState();
    final settingsAndroid = AndroidInitializationSettings('logosaicc.png');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async => await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => App(),
        ),
      );

  @override
  Widget build(BuildContext context) => Container();
}
