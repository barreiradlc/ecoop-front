
import 'package:flutter/material.dart';
import './Tabs.dart';

import 'package:universal_html/prefer_universal/html.dart' as web;

import 'dart:math' as math;
void main() => runApp(Home());
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: Text('E_coop')),
        body: CollapsingList(),
      ),
    );
  }
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
class CollapsingList extends StatelessWidget {
  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 20,
        maxHeight: 200.0,
        child: Container(
          color: Colors.white, 
          child: Center(
            child:Text(headerText)
          )
        ),
      ),
    );
  }
  SliverPersistentHeader makeHeader2(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 0,
        maxHeight: 200.0,
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
    return CustomScrollView(
      slivers: <Widget>[
        // makeHeader(myPref),
        makeHeader(' 22 itens este mês'),
        makeHeader('Produziste 43 artes com materias reciclados'),
        makeHeader2('Camera'),
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