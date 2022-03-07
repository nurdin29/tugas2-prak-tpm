import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool loginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login Screen'),
        ),
        body: Column(
          children: [
            _logo(),
            _username(),
            _password(),
            _loginButton(context),
            _forgotPassword(),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 160, 0, 60),
        child: FlutterLogo(
          size: 70,
        ),
      ),
    );
  }

  Widget _username() {
    return Container(
      padding: EdgeInsets.only(right: 70, left: 70, top: 15),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          labelText: 'Username',
          contentPadding: const EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide:
            BorderSide(color: (loginSuccess) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _password() {
    return Container(
      padding: EdgeInsets.only(bottom: 35, right: 70, left: 70, top: 15),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          contentPadding: const EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide:
            BorderSide(color: (loginSuccess) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      width: 350, height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (loginSuccess) ? Colors.blue : Colors.red,
          onPrimary: Colors.white,
        ),
        onPressed: () {
           String text = "";
          if (username == "nurdin" && password == "nurdin") {
            setState(() {
              text = 'Login Berhasil';
              loginSuccess = true;
            });
          } else {
            setState(() {
              text = 'Login Gagal';
              loginSuccess = false;
            });
          }

          SnackBar snackBar = SnackBar(
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Log In', style: TextStyle(fontSize: 17),),
      ),
    );
  }

  Widget _forgotPassword() {
    return Container(
      child:
      TextButton(
          onPressed: () {},
          child: Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.grey),
          )),
    );
  }
}
