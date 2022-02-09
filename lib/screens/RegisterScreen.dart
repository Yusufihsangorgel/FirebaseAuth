import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/RegisterController.dart';
import 'package:todo/screens/LoginScreen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  RegisterController registerController = Get.put(RegisterController());
  String? _newUser;
  String? _newPassword;
  String? _name;
  String? _surname;
  String? _age;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
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
                    labelText: "Mail",
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Mailinizi Giriniz";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _newUser = value!;
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
                    _newPassword = value!;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    labelText: "İsim",
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "İsminizi Giriniz";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    labelText: "Soyisim",
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Soyisminizi Giriniz";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _surname = value!;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    labelText: "Yaş",
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Yaşınızı Giriniz";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _age = value!;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [],
                ),
                ElevatedButton(
                    child: Text("Kayıt Ol"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                      if (_newUser!.length > 3 && _newPassword!.length > 3) {
                        debugPrint("Kayıt başarılı");
                        registerController.Register(_newUser, _newPassword);
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text("Başarıyla kayıt oldunuz"),
                                actions: [
                                  MaterialButton(
                                      child: Text("Anasayfaya dön"),
                                      onPressed: () {
                                        Get.to(LoginScreen());
                                      })
                                ],
                              );
                            });
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
                                      onPressed: () {
                                        Get.to(RegisterScreen());
                                      })
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
      ),
    );
  }
}
