import 'package:flutter/material.dart';
import 'package:win_app/ShortFunc.dart';
import 'package:win_app/DB.dart';
import 'package:win_app/Client/Manufacturers.dart';
import 'dart:io';

class Register extends StatelessWidget {
  //BuildContext context;
  //Authorization(this.context);

  TextStyle h1 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  );

  InputDecoration DecorationField(String label) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      labelText: label,
    );
  }

  final mainColor = Colors.blue;
  final backColor = Colors.white;
  final _padding = 30.0;

  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _addr = TextEditingController();
  TextEditingController _phone = TextEditingController();

  Register({String email, String pass}) {
    if (email == "") return;
    _email.text = email;
    _pass.text = pass;
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
            Text("Регистрация", style: h1),
            SizedBox(height: _padding),
            TextField(
              controller: _email,
              decoration: DecorationField("Эллектронная почта"),
            ),
            SizedBox(height: _padding),
            TextField(
              controller: _pass,
              obscureText: true,
              decoration: DecorationField("Пароль"),
            ),
            SizedBox(height: _padding),
            TextField(
              controller: _name,
              decoration: DecorationField("ФИО"),
            ),
            SizedBox(height: _padding),
            TextField(
              controller: _addr,
              decoration: DecorationField("Адрес"),
            ),
            SizedBox(height: _padding),
            TextField(
              controller: _phone,
              decoration: DecorationField("Номер телефона"),
            ),
            SizedBox(height: _padding),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              color: mainColor,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text("Зарегистрироваться",
                  style: TextStyle(
                    color: backColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () => tapSingIn(context),
            ),
          ],
        ),
      ),
    );
  }

  Future tapSingIn(BuildContext context) {
    if (_email.text == "" &&
        _pass.text == "" &&
        _name.text == "" &&
        _addr.text == "" &&
        _phone.text == "")
      return alert(context,
          title: "Регистрация",
          message: "Не все поля заполнены!",
          icon: "error");
    //
    Map<String, dynamic> data;
    data["email"] = _email.text;
    data["password"] = _pass.text;
    data["fullName"] = _name.text;
    data["addres"] = _addr.text;
    data["phone"] = _phone.text;
    data["numberOfOrders"] = 0;
    //
    DB.insert("Clients", data);
    var f = File("lib\\log.txt");
    f.writeAsString("${_email.text}\n${_pass.text}");
    //
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Manufacturers()));
  }
}
