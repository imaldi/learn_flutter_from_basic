import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var nama = "";
  var username = "";
  var email = "";
  var password = "";
  var address = "";
  var phoneNumber = "";

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
                controller: nameController,
                // decoration: InputDecoration(hintText: "Nama Lengkap"),
                decoration: InputDecoration(label: Text("Nama Lengkap")),
              ),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(label: Text("Username")),
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(label: Text("Email")),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(label: Text("Password")),
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(label: Text("Address")),
              ),
              TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    label: Text("Phone Number")),
              ),
              SizedBox(height: 32,),
              ElevatedButton(onPressed: (){
                setState(() {
                  nama = nameController.text;
                  username = usernameController.text;
                  email = emailController.text;
                  password = passwordController.text;
                  address = addressController.text;
                  phoneNumber = phoneNumberController.text;
                  nameController.text = "";
                  usernameController.text = "";
                  emailController.text = "";
                  passwordController.text = "";
                  addressController.text = "";
                  phoneNumberController.text = "";
                });
              }, child: Text("Register")),
              SizedBox(height: 32,),
              Text("Hasil Submit Form:"),
              Text("Name: ${nama}"),
              Text("UserName: ${username}"),
              Text("Email: ${email}"),
              Text("Password: ${password}"),
              Text("Address: ${address}"),
              Text("Phone Number: ${phoneNumber}"),
            ],
          ),
        ),
      ),),
    );
  }
}

