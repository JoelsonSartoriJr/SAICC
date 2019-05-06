import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../widgets/tabbar.dart';
import '../definitions/text.dart';
import '../definitions/colors.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController controller;
  
  @override
  void initState(){
    controller = new TabController(
      vsync: this,
      length: 6,
    );
    super.initState();
  }
  
  @override
  void dispose(){
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
          tabs: TabBarBuild().obterTabBarList(),
        ),
        backgroundColor: ColorsDefinitions().obterAppBarColor(),
      ),
      body: TabBarView(
        controller: controller,
        children: TabBarBuild().obterTabBarItensList(),
      ),
      drawer: SideMenu(),
    );
  }
}
