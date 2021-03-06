import "package:flutter/material.dart";
import 'package:get/get.dart';
import "package:todo/controllers/LoginController.dart";
import 'package:todo/screens/HomeScreen.dart';
import 'package:todo/screens/RegisterScreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());

  String? _username;
  String? _password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  labelText: "Kullanıcı Adı",
                  labelStyle: TextStyle(color: Colors.purple),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Kullanıcı Adınızı Giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  labelText: "Şifre",
                  labelStyle: TextStyle(color: Colors.purple),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Şifrenizi Giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                      child: Text("Üye Ol"),
                      onPressed: () {
                        Get.to(() => RegisterScreen());
                      }),
                  MaterialButton(
                      child: Text("Şifremi Unuttum"),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Material Dialog'),
                                content: Text('Hey! I am Coflutter!'),
                                actions: <Widget>[
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.purple),
                                      ),
                                      labelText: "Şifre",
                                      labelStyle:
                                          TextStyle(color: Colors.purple),
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Şifrenizi Giriniz";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      _password = value!;
                                    },
                                  ),
                                  Text('Close'),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('HelloWorld!'),
                                  )
                                ],
                              );
                            });
                      })
                ],
              ),
              ElevatedButton(
                  child: Text("Giriş Yap"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                    if (_username!.length > 3 && _password!.length > 3) {
                      debugPrint("Giriş başarılı");
                      loginController.Login(_username, _password);
                    } else {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Hata"),
                              content: Text("Giriş Bilgileriniz Hatalı"),
                              actions: [
                                MaterialButton(
                                    child: Text("Geri Dön"),
                                    onPressed: () => Navigator.pop(context))
                              ],
                            );
                          });
                    }
                  }),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*Widget loginButton() => RaisedButton(
      child: Text("Giriş Yap"),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
        }
        if (_username == "a" && _password == "a") {
          debugPrint("Giriş başarılı");
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Hata"),
                  content: Text("Giriş Bilgileriniz Hatalı"),
                );
              });
        }
      });*/
}
