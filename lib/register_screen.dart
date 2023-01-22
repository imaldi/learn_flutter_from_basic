import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Screen"),),
      body: Center(child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text("Silahkan Registrasi Dahulu"),
              TextFormField(
                // decoration: InputDecoration(hintText: "Nama Lengkap"),
                decoration: InputDecoration(label: Text("Nama Lengkap")),
              ),
              TextFormField(
                decoration: InputDecoration(label: Text("Username")),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(label: Text("Email")),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(label: Text("Password")),
              ),
              TextFormField(
                decoration: InputDecoration(label: Text("Address")),
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    label: Text("Phone Number")),
              ),
            ],
          ),
        ),
      ),),
    );
  }
}

