import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './ui/create_profile.dart';

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

                Padding(padding: EdgeInsets.all(15.0),),

                Text(
                    "An app to meet other teachers and share resources",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Roboto',
                        color: Colors.white)),

                Padding(padding: EdgeInsets.all(60.0),),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    OutlineButton(
                      child: Text("Sign up", style: TextStyle(color: Colors.white, fontSize: 20.0)),
                      padding: EdgeInsets.all(5.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> CreateProfile())
                        );
                        
                        
                      }),

                    OutlineButton(
                        child: Text("Sign in", style: TextStyle(color: Colors.white, fontSize: 20.0)),
                        padding: const EdgeInsets.all(5.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        onPressed: ()=>debugPrint("Sign in pressed")),


                  ],
                ),

                Padding(padding: EdgeInsets.all(60.0),),

                InkWell(
                  onTap: ()=> debugPrint("Skip Button Pressed"),
                  child: Text("Skip this for now!>>>",
                  style: TextStyle(
                    fontSize: 18.0, fontFamily: 'Roboto', color: Colors.white)),
                )



              ],
            ),
          )






        ],
      ),

    );
  }
}


