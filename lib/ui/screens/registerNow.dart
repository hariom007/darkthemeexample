import 'package:darkthemeexample/notifiers/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisternOw extends StatefulWidget {
  const RegisternOw({Key key}) : super(key: key);

  @override
  _RegisternOwState createState() => _RegisternOwState();
}

class _RegisternOwState extends State<RegisternOw> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register Now'
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Text('Refister account'),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                style: TextStyle(
                  color: themeProvider.darkTheme ? Colors.blue : Colors.black
                ),
                children: [
                  TextSpan(
                    text: 'dsdsdsd'
                  ),

                ]
              )
          ),
          SizedBox(height: 20,),
          Icon(
            Icons.email,
            size: 100,
            color: themeProvider.darkTheme ?  Colors.blue : Colors.red,
          )
        ],
      ),
    );
  }
}
