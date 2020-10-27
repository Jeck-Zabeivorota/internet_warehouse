import 'package:flutter/material.dart';
import 'dart:io';

class Manufacturers extends StatelessWidget {
  //BuildContext context;
  //Authorization(this.context);

  TextStyle h1 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  final mainColor = Colors.blue;
  final backColor = Colors.white;
  final _padding = 30.0;

  String _email, _pass;

  Manufacturers({String email, String pass}) {
    _email = email;
    _pass = pass;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: BuildAppBar(context),
      body: Body(context),
    );
  }

  AppBar BuildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Производители"),
      backgroundColor: mainColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: backColor,
        iconSize: 24.0,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: backColor,
          iconSize: 24.0,
          onPressed: () {},
        ),
        SizedBox(
          width: 20,
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          color: backColor,
          iconSize: 24.0,
          onPressed: () {
            print("Email: $_email");
            print("Password: $_pass");
          },
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  Container Body(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(_padding)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _padding),
        child: ListView(
          children: [
            SizedBox(height: _padding),
            Center(
              child: Wrap(
                spacing: _padding,
                runSpacing: _padding,
                children: List.generate(10, (index) {
                  if (index % 2 == 0) {
                    return manufacturer(
                        title: "Apple",
                        image: File("lib\\Assets\\mac-os-logo.png"));
                  } else {
                    return manufacturer(
                        title: "Asus", image: File("lib\\Assets\\asus.png"));
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  RaisedButton manufacturer({String title, File image}) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_padding / 2),
      ),
      elevation: 20.0,
      color: mainColor,
      padding: EdgeInsets.all(0.0),
      child: Column(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: backColor,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(_padding / 2)),
            ),
            padding: EdgeInsets.all(_padding / 2),
            child: Image.file(
              image,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: _padding / 5),
          Text(
            title,
            style: TextStyle(
              color: backColor,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: _padding / 5),
        ],
      ),
      onPressed: () {},
    );
  }
}
