import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../authentication/authentication.dart';
import '../widgets/drawer.dart';
import '../widgets/tabbar.dart';
import '../mixins/rootModel.dart';
import '../definitions/text.dart';
import '../definitions/colors.dart';
import '../sources/firebase.dart';

class Home extends StatefulWidget {
  final FirebaseUser user;
  final RootModel model;
  final VoidCallback onSignedOut;

  Home({this.model, this.onSignedOut, this.user});
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;
  final FirebaseMessaging _messaging = FirebaseMessaging();
  @override
  void initState() {
    _controller = new TabController(
      vsync: this,
      length: widget.model.dias.dia.length + 1,
    );
    super.initState();

    _messaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) {
        print('on launch $message');
      },
    );
    _messaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _messaging.getToken().then((token){
      FirebaseDatabaseSnapshot().setTokenSmartphone(widget.model.referencia, token);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextDefinition().obterAppHomeText()),
        bottom: TabBar(
          isScrollable: true,
          controller: _controller,
          tabs: TabBarBuild().obterTabBarList(widget.model.dias.dia),
        ),
        backgroundColor: ColorsDefinitions().obterAppBarColor(),
      ),
      body: TabBarView(
        controller: _controller,
        children: TabBarBuild().obterTabBarItensList(
            widget.model.dias.dia, widget.model.eventos, widget.model.feed, widget.model.referencia),
      ),
      drawer: SideMenu(widget.model.parceiros, widget.model.patrocinadores, widget.model.organizacao, widget.model.referencia, widget.onSignedOut, widget.user),
    );
  }
}
