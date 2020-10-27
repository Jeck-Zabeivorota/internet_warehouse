import 'package:flutter/material.dart';
import 'package:win_app/ShortFunc.dart';
import 'package:win_app/DB.dart';
import 'package:win_app/Authorization/Register.dart';
import 'package:win_app/Client/Manufacturers.dart';

class Login extends StatelessWidget {
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

  Login({String email = "", String pass = ""}) {
    if (email == "") return;
    _email.text = email;
    _pass.text = pass;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: BuildAppBar(),
      body: Body(context),
    );
  }

  AppBar BuildAppBar() {
    return AppBar(
      backgroundColor: mainColor,
      elevation: 0,
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
            Text("Вход", style: h1),
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
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: mainColor,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text("Войти",
                  style: TextStyle(
                    color: backColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () => tapSignIn(context),
            ),
            SizedBox(height: _padding / 2),
            Center(
              child: FlatButton(
                hoverColor: Colors.blue[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_padding / 2),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: _padding / 5, horizontal: _padding),
                  child: Text(
                    "Зарегистрироваться",
                    style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Register(email: _email.text, pass: _pass.text)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future tapSignIn(BuildContext context) {
    if (_email.text == "" && _pass.text == "")
      return alert(context,
          title: "Вход", message: "Не все поля заполнены!", icon: "error");

    var user = DB.queryOne("Client", "email", _email.text);
    print(user);
    if (user["password"] != _pass.text)
      return alert(context,
          title: "Вход", message: "Пароль не верный!", icon: "error");

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Manufacturers(email: _email.text, pass: _pass.text)));
  }
}
