
import 'package:flutter/material.dart';
import './Tabs.dart';

import 'package:universal_html/prefer_universal/html.dart' as web;

import 'package:shared_preferences/shared_preferences.dart';

import 'dart:math' as math;
void main() => runApp(Home());

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('E_cartio')),
        body: HomeState(),
      ),
    );
  }
}

class HomeState extends StatefulWidget{
  @override
  CollapsingList createState() => CollapsingList();
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, 
      double shrinkOffset, 
      bool overlapsContent) 
  {
    return new SizedBox.expand(child: child);
  }
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
class CollapsingList extends State<HomeState> {
  
  String jwt = 'testeJWT';
  String username = '';

  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 0,
        maxHeight: 80.0,
        
          child: Center(
            child:Text(headerText)
          )
        
      ),
    );
  }
  SliverPersistentHeader makeHeader2(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 0,
        maxHeight: 40.0,
        child: Center(
          child:RaisedButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/camera');
              },
              child:Icon(Icons.camera_alt)
          )
        ),
      ),
    );
  }

  var myPref = web.window.localStorage['mypref'];
  

  @override
  Widget build(BuildContext context) {
    


    Future<String> _getJWT() async {
      final authJwt = await SharedPreferences.getInstance();  
      String jwt = authJwt.getString("jwt");
      String username = authJwt.getString("username");
      setState(() {
        this.jwt = jwt;
        this.username = username;
      });
      // this.jwt = jwt2;
      return jwt;
    }

    _getJWT();

    return CustomScrollView(
      slivers: <Widget>[
        // makeHeader(myPref),
        makeHeader(
          'Seja bem vindo(a): ' + this.username
        ),
        
        // makeHeader2('Camera'),

        SliverGrid.count(
          crossAxisCount: 1,
          children: [
            Tabs(),
          ],
        ),        
      ],
    );
  }
}