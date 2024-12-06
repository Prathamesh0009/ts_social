import 'package:flutter/material.dart';
import 'package:ts_social/screens/feature1_screen.dart';
import 'package:ts_social/widgets/app_drawer.dart';
import 'package:ts_social/screens/feature2_screen.dart';
import 'package:ts_social/screens/feature3_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin { //required to make animations work, such as switching between tabs
  late TabController _tabController; // variable will be initialized later (inside initState) & which will manage the tabs in the screen

  @override
  void initState() {
    super.initState(); //Calls the parent class's initState method , This ensures that the widget is properly set up before adding custom logic.
    _tabController = TabController(length: 3, vsync: this);  //vsync prevents animations from running when the widget is off-screen , this refers to the current widget
  }

  @override 
  //This method is called when the widget is removed from the screen i.e. if we navigated to another page.Used to clean up resources 
  void dispose() { 
    _tabController.dispose(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thoughtsketch'),
      ),
      drawer: const AppDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Feature1Screen(),
          Feature2Screen(),
          Feature3Screen(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Feature 1'),
            Tab(icon: Icon(Icons.business), text: 'Feature 2'),
            Tab(icon: Icon(Icons.school), text: 'Feature 3'),
          ],
        ),
      ),
    );
  }
}
