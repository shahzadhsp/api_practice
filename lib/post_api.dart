import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SignUpApiScreen extends StatefulWidget {
  const SignUpApiScreen({super.key});

  @override
  State<SignUpApiScreen> createState() => _SignUpApiScreenState();
}

class _SignUpApiScreenState extends State<SignUpApiScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  void login(String name, job) async {
    try {
      String Url = 'https://reqres.in/api/users';
      Response response = await http
          .post(Uri.parse(Url), body: {'name': name, 'job': job});
          var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Sign Up SuccessFully');
      } else {
        print('Sign Up Failde');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up Api ')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: 'Enter Youyr name',
                  fillColor: Colors.pink,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(16.0)),
                  hintStyle: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: jobController,
              decoration: InputDecoration(
                  hintText: 'Enter Youyr job',
                  fillColor: Colors.pink,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(16.0)),
                  hintStyle: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                login(nameController.text.toString(),
                    jobController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(17.0)),
                child: Center(child: Text('Sign Up')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
