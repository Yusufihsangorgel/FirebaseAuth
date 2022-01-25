import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          TextField(
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 17),
              hintText: 'Görevi yazınız',
              suffixIcon: Icon(
                Icons.add_box,
                color: Colors.black,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                left: 10,
                top: 20,
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            height: 1,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
        ],
      ),
    );
  }
}
