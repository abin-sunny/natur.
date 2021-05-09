import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newecommerce/constants.dart';
import 'package:newecommerce/presentation/auth/signin.dart';
import 'package:newecommerce/presentation/homepage/profile.dart';
import 'package:newecommerce/presentation/homepage/widgsets.dart';
import 'package:newecommerce/presentation/mwidgets.dart';
import 'package:provider/provider.dart';
import 'package:newecommerce/services/services.dart';
import '../../constants.dart';
import 'components/homewidgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  // User user = FirebaseAuth.instance.currentUser;
  TabController _tabController;
  TabController _itabController;
// PageController _controller;
String name = FirebaseAuth.instance.currentUser.displayName;

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    _itabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _itabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 0,
        child: ListView(
          children: [
            Container(
              height: objectsize(70, context),
              color: presscolor,
              child: DrawerHeader(
                  child: Text(FirebaseAuth.instance.currentUser.displayName??FirebaseAuth.instance.currentUser.email.substring(0,FirebaseAuth.instance.currentUser.email.indexOf('@')),
                     
                   
                     
                      style: TextStyle(fontSize: 20, color: Colors.white))),
            ),
            ListTile(title: Text('Trending '), onTap: () {}),
            ListTile(title: Text('Best Seller'), onTap: () {}),
            ListTile(title: Text('Wish List'), onTap: () {}),
            ListTile(title: Text('Try prime'), onTap: () {}),
            ListTile(
                title: Text('Yor Account'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Profile()));
                }),
            ListTile(
                title: Text('Sign Out'),
                onTap: () {
                  context.read<FlutterFireAuthService>().signOut();
                  Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SignIn()))
                      .then((value) {
                    showSnack(context, Text('Sign out'), 3);
                  });
                }),
            // ListView.builder(itemBuilder: itemBuilder)
          ],
        ),
      ),
      appBar: appbarr(
        'Natur.',
        Builder(
          builder: (context) => IconButton(
              icon: Image.asset('assets/icons/menu.png'),
              onPressed: () => Scaffold.of(context).openDrawer()),
        ),
        [
          Padding(
            padding: EdgeInsets.only(right: 23),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
              child: Hero(
                  tag: "hero",
                  child: profileimag(objectsize(17, context), child: null)),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              24, objectsize(16, context), 29, objectsize(15, context)),
          child: Container(
              height: objectsize(100, context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TabBar(
                      // physics: NeverScrollableScrollPhysics(),
                      indicatorPadding: EdgeInsets.symmetric(
                          horizontal: objectsize(12.5, context)),
                      controller: _tabController,
                      isScrollable: false,
                      automaticIndicatorColorAdjustment: true,
                      labelColor: Color.fromRGBO(255, 255, 255, 1),
                      unselectedLabelColor: Color.fromRGBO(225, 160, 103, 1),
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color.fromRGBO(225, 160, 103, 1)),
                      tabs: <Widget>[
                        Container(
                          width:objectsize(60, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                        border: Border.all(color:bordercolor)
                          ),
                          child: Tab(
                            child: Container(
                              child: Text(
                                "Chair",
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w300),
                              ),
                            ),
                            icon: ImageIcon(
                              AssetImage(
                                'assets/icons/realchair.png',
                              ),
                            ),
                          ),
                        ),
                        Container(
                            width:objectsize(60, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                        border: Border.all(color:bordercolor)
                          ),
                          child: Tab(
                            child: Container(
                              child: Text(
                                "Tables",
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w300),
                              ),
                            ),
                            icon: ImageIcon(
                              AssetImage(
                                'assets/icons/study.png',
                              ),
                            ),
                          ),
                        ),
                        Container(
                            width:objectsize(60, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                        border: Border.all(color:bordercolor)
                          ),
                          child: Tab(
                            child: Container(
                              child: Text(
                                "Lambs",
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w300),
                              ),
                            ),
                            icon: ImageIcon(
                              AssetImage('assets/icons/storage.png'),
                            ),
                          ),
                        ),
                        Container(
                            width:objectsize(60, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                        border: Border.all(color:bordercolor)
                          ),
                          child: Tab(
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    "Chair",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            icon: ImageIcon(
                              AssetImage('assets/icons/storage.png'),
                            ),
                          ),
                        ),
                      ]),
                  spacer(context, 14),
                ],
              )),
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          spacer(context, 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: search(),
          ),
          spacer(context, 30),
          Expanded(
            child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  Page(itabController: _itabController,
                  
                  cat:'storage',
                  ),
                  Page(itabController: _itabController
                  // ,cat: 'storage',
                  ),
                  Page(itabController: _itabController),
                  Page(itabController: _itabController),
                ]),
          ),
          spacer(context, 45),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Categories',
              style: TextStyle(color: titlecolor, fontSize: 21),
            ),
          ),
        ],
      )),
    );
  }
}

class Page extends StatelessWidget {
  const Page({
    this.cat,
    @required TabController itabController,
  })  : _itabController = itabController;
     final cat; 

  final TabController _itabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
              labelColor: titlecolor,
              labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              indicator: CircleTabIndicator(
                color: titlecolor,
                radius: 3,
              ),
              controller: _itabController,
              isScrollable: true,
              tabs: [
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Tab(
                    text: 'New',
                  ),
                ),
                Tab(text: 'Popular'),
                Tab(text: 'Sale'),
              ]),
        ),
        spacer(context, 13),
        WholePageTab(itabController: _itabController)
      ],
    );
  }
}
