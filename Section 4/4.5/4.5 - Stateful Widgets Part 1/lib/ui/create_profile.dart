import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Create a Profile"),
        backgroundColor: Colors.deepPurple,
      ),


      body: Stack(
        children: <Widget>[
          Form(
            child: ListView(
              children: <Widget>[

                TextFormField(
                  controller: _userController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter a User Name',
                      contentPadding: const EdgeInsets.all(20.0),
                    labelText: 'User Name'
                  ),
                ),

                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'you@example.com',
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: 'Email address'
                  ),
                ),
                

              ],
            ),
          ),





        ],
      ),

    );
  }
}
