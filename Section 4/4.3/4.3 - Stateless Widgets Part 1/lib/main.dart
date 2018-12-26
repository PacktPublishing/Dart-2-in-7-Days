import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(
    new MaterialApp(
      home: new HomeScreen(),
      debugShowCheckedModeBanner: false,
    )
  );
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.light
    ));

    return Scaffold(

      body: Stack(
        children: <Widget>[
          new Image.asset(
            'images/background.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),

          Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Padding(padding: EdgeInsets.all(15.0),),

                Text(
                  "Teacher's \n Corner",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36.0, fontWeight: FontWeight.w500,
                    fontFamily: 'Chalkduster',
                    color: Colors.green)),

               










              ],
            ),
          )






        ],
      ),

    );
  }
}


