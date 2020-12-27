import 'package:bloc_pattern_app/FirstScreen.dart';
import 'package:bloc_pattern_app/bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Pattern"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<String>(
                stream: bloc.email,
                builder:(context,snapshot) => TextField(
                  onChanged: bloc.emailChanged,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    labelText: "Email",
                    errorText: snapshot.error,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              StreamBuilder<String>(
                stream: bloc.password,
                builder:(context,snapshot) => TextField(
                  onChanged: bloc.passwordChanged,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                    errorText: snapshot.error,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              StreamBuilder<bool>(
                stream: bloc.submitCheck,
                builder:(context,snapshot) => RaisedButton(
                  onPressed: snapshot.hasData ? () => changePage(context) : null,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Text("Submit", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  changePage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FirstScreen()));
  }
}





























