import 'package:flutter/material.dart';

void main() => runApp(Chat());

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final title = 'Itens';

    return MaterialApp(
      // title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text(title),
        // ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Item'),
            ),
            
          ],
        ),
      ),
    );
  }
}