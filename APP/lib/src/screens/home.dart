import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/drawer.dart';
import '../widgets/tabbar.dart';
import '../mixins/rootModel.dart';
import '../definitions/text.dart';
import '../definitions/colors.dart';

class Home extends StatefulWidget {
  final FirebaseUser user;
  final RootModel model;
  final VoidCallback onSignedOut;

  Home({this.model, this.onSignedOut, this.user});
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;
  
  @override
  void initState() {
    _controller = new TabController(
      vsync: this,
      length: widget.model.dias.dia.length + 1,
    );
    super.initState();
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
            widget.model.dias.dia, widget.model.eventos, widget.model.feed, widget.model.referencia, widget.user),
      ),
      drawer: SideMenu(widget.model.parceiros, widget.model.patrocinadores, widget.model.organizacao, widget.model.referencia, widget.onSignedOut, widget.user),
    );
  }
}
