import 'package:flutter/material.dart';

import './Home/Chat.dart';
import './Home/Materiais.dart';
import './Home/Artes.dart';


void main() {
  runApp(Tabs());
}

class Tabs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lime,
        // See https://github.com/flutter/flutter/wiki/Desktop-shells#fonts
        primaryColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner :false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: tabs(),
            // title: Text('Início'),
          ),
          body: TabBarView(
            children: [
              Chat(),
              Artes(),
              Materiais(),
            ],
          ),
        ),
      ),

    );
  }
}

Widget tabs(){
  return TabBar(
              tabs: [
                Tab(
                  icon: 
                    Icon(Icons.chat),
                  child:
                    Text('Chat')
                ),
                Tab(
                  icon: 
                    Icon(Icons.brush),
                  child:
                    Text('Artes')
                  ),
                Tab(
                  icon: 
                    Icon(Icons.extension),
                  child:
                    Text('Materiais')
                  ),
              ],
            );
}