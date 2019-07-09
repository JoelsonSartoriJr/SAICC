import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../authentication/authentication.dart';
import '../widgets/drawer.dart';
import '../widgets/tabbar.dart';
import '../mixins/rootModel.dart';
import '../definitions/text.dart';
import '../definitions/colors.dart';

class Home extends StatefulWidget {
  final FirebaseUser user;
  final RootModel model;
  final AuthImplementation auth;
  final VoidCallback onSignedOut;

  Home({this.model, this.auth, this.onSignedOut, this.user});
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(
      vsync: this,
      length: widget.model.dias.dia.length + 1,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextDefinition().obterAppHomeText()),
        bottom: TabBar(
          isScrollable: true,
          controller: controller,
          tabs: TabBarBuild().obterTabBarList(widget.model.dias.dia),
        ),
        backgroundColor: ColorsDefinitions().obterAppBarColor(),
      ),
      body: TabBarView(
        controller: controller,
        children: TabBarBuild().obterTabBarItensList(
            widget.model.dias.dia, widget.model.eventos, widget.model.feed, widget.model.referencia),
      ),
      drawer: SideMenu(widget.model.parceiros, widget.model.patrocinadores, widget.model.organizacao, widget.model.referencia, widget.auth, widget.onSignedOut, widget.user),
    );
  }
}
