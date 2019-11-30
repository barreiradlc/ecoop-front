import 'dart:io' show Platform;  //at the top
import 'package:flutter/foundation.dart' show TargetPlatform;


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

// class Login extends StatefulWidget {
//   @override
//   LoginState createState() => new LoginState();
// }

// class LoginState extends State<Login>{

//   final _formLogin = GlobalKey<FormState>();
//   final _formSenha = GlobalKey<FormState>();

//   Future<String> getReq() async {
//     var url = 'https://jsonplaceholder.typicode.com/posts';
//     http.Response response = await http.get(Uri.encodeFull(url));

//     print (_formLogin.currentState);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Bem vindo',
//               textAlign: TextAlign.center,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Form(
//                 key: _formLogin,
//                 child: // Build this out in the next steps.
//                     TextFormField(
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Login',
//                   ),
//                   // The validator receives the text that the user has entered.
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Tens que digitar algo';
//                     } else {
//                       return 'Usuário digitado';

//                       // Navigator.pushNamed(context, '/second');
//                     }
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Form(
//                 key: _formSenha,
//                 child: // Build this out in the next steps.
//                     TextFormField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Senha',
//                   ),
//                   // The validator receives the text that the user has entered.
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Tens que digitar algo';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30, width: 80),
//             RaisedButton(
//               padding: const EdgeInsets.all(0.0),
//               onPressed: getReq,
//               // onPressed: () {

//               //   if (_formLogin.currentState.validate() && _formSenha.currentState.validate()) {

//               //     _makeGetRequest();

//               //     Scaffold.of(context)

//               //         .showSnackBar(SnackBar(content: Text('Processing Data')));
//               //   }
//               // },
//               child: Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: <Color>[
//                       Color(0xffd86b00),
//                       Color(0xfcba0300),
//                       Color(0xffd86b00),
//                       Color(0xffd86b00),
//                     ],
//                   ),
//                 ),
//                 padding: const EdgeInsets.all(20.0),
//                 child: const Text('Login',
//                     style: TextStyle(
//                         height: 1, fontSize: 20, color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  Future<String> getReq() async {
    // var url = 'https://agencia-provisorio.000webhostapp.com/';
    // var endpoint = 'wp-json/jwt-auth/v1/token';

    // http.Response response = await http.post(Uri.encodeFull(url + endpoint),
    //     body: {'username': 'WebDesign', 'password': 'web!gestao'});
    const bool kIsWeb = identical(0, 0.0);

    // var token = jsonDecode(response.body);

    // print(token);
    
    
    if (kIsWeb) {
      // web.window.localStorage['mypref'] = token['token'];
      // Navigator.pushNamed(context, '/home');
      print('não mobile');
    } else {
      print ('é mobile xuxu');
    }
    
    // web.window.localStorage['mypref'] = token['token'];
      
    // if (token['token'] != null) {
    //   print('login');
    //   Navigator.pushNamed(context, '/home');
    // } else {
    //   print('tratar erro');
    // }

    // if (!Platform.isIOS && !Platform.isAndroid) {
    // } 
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
              "ART & ECO",
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
