import 'dart:io' show Platform;  //at the top
import 'package:flutter/foundation.dart' show TargetPlatform;

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';
import 'dart:convert';

import 'package:universal_html/prefer_universal/html.dart' as web;


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


// Define a custom Form widget.
class Login extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<Login> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  // final myController = TextEditingController(text: 'test4567@example.com');
  // final myController2 = TextEditingController(text: 'password');

  final myController = TextEditingController(text: '');
  final myController2 = TextEditingController(text: '');

  Future<String> getReq() async {
    // cloud
    var url = 'https://ae-teste.herokuapp.com';

    // local
    // var url = 'http://localhost:3000';
    
    var endpoint = '/auth/login';
    
      print('req');
      http.Response response =
        await http.post(Uri.encodeFull(url + endpoint), body: {
        // 'username': usuarioCred.text,
        'email': myController.text,
        'password': myController2.text
      });
      const bool kIsWeb = identical(0, 0.0);
      var res = jsonDecode(response.body);

      if (res['errors'] == null) {
        SharedPreferences jwt = await SharedPreferences.getInstance();

        print('sucesso');
        print(res);
        print(res['token']);
        print('sucesso');
        // http.Response res2 = await http.post(Uri.encodeFull(url + endpoint),
        //     body: {'email': emailCred.text, 'password': senhaCred.text});
        // var login = jsonDecode(res2.body);

        // if (kIsWeb) {
        //   web.window.localStorage['mypref'] = login['token'];
        //   print('não mobile');
        // } else {  
        //   await jwt.setString('jwt', login['token']);
        //   print("mobile");
        // }
        await jwt.setString('jwt', res['token']);
        await jwt.setString('username', res['username']);
        
        Navigator.pushNamed(context, '/home');
        

      } else {
        print('erro');
      }

      // print(token);

    // } else {
    //   print('deu ruim');
    //   return showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //           // Retrieve the text the that user has entered by using the
    //           // TextEditingController.
    //           content: Text(
    //         "A senha e confirmação se diferem",
    //       ));
    //     },
    //   );
    // }
    // //

    // // if (!Platform.isIOS && !Platform.isAndroid) {
    // // }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              "ECARTO",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              controller: myController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Usuário',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              controller: myController2,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha',
              ),
            ),
          ),
          RaisedButton(
            onPressed: getReq,
            color: Colors.lime,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Login', style: TextStyle(fontSize: 20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child:RaisedButton(
            
            onPressed: (){
              Navigator.pushNamed(context, '/cadastro');
            },
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text('Ainda não tem uma conta? Clique aqui para registrar-se', style: TextStyle(fontSize: 10)),
            ),
          ),
          )       

        ],
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(myController.text + myController2.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
