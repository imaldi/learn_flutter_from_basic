import 'package:flutter/material.dart';
import 'package:learn_flutter_from_basic/presentation/screens/login/login_screen.dart';
import 'package:learn_flutter_from_basic/service/user_service.dart';

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
  var formKey = GlobalKey<FormState>();
  var userService = UserService();

  @override
  void initState() {
    super.initState();
    // userService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Screen"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text("Silahkan Registrasi Dahulu"),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if ((value?.length ?? 0) > 20) {
                        return "Nama Tidak Boleh Lebih Dari 5 Karakter";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      nama = nameController.text;
                      nameController.text = "";
                    },
                    // decoration: InputDecoration(hintText: "Nama Lengkap"),
                    decoration: InputDecoration(label: Text("Nama Lengkap")),
                  ),
                  TextFormField(
                    controller: usernameController,
                    validator: (val) {
                      if ((val?.isEmpty ?? false)) {
                        return "Field ini tidak boleh kosong";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      username = usernameController.text;
                      usernameController.text = "";
                    },
                    decoration: InputDecoration(label: Text("Username")),
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (val) {
                      email = emailController.text;
                      emailController.text = "";
                    },
                    decoration: InputDecoration(label: Text("Email")),
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    onSaved: (val) {
                      password = passwordController.text;
                      passwordController.text = "";
                    },
                    decoration: InputDecoration(label: Text("Password")),
                  ),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(label: Text("Address")),
                    onSaved: (val) {
                      address = addressController.text;
                      addressController.text = "";
                    },
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    onSaved: (val) {
                      phoneNumber = phoneNumberController.text;
                      phoneNumberController.text = "";
                    },
                    decoration: InputDecoration(label: Text("Phone Number")),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if ((formKey.currentState?.validate() ?? false)) {
                          setState(() {
                            formKey.currentState?.save();
                          });
                          var isRegisterSuccess = await userService.createUser(
                              username,
                              password,
                              email,
                              nama,
                              address,
                              phoneNumber,
                          );

                          if(isRegisterSuccess == UserCreationResult.success){
                            var user = await userService.authenticateUser(username, password);
                            print("user: ${user?.name}");
                            print("user: ${user?.username}");
                            print("user: ${user?.password}");
                            print("user: ${user?.address}");
                            print("user: ${user?.phoneNumber}");
                          }
                        }
                      },
                      child: Text("Register")),
                  ElevatedButton(
                      onPressed: () async {
                        await userService.removeAllUsers();
                        print("Hapus seluruh user sukses");
                      },
                      child: Text("Hapus Seluruh User")),
                  SizedBox(
                    height: 32,
                  ),
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
          ),
        ),
      ),
    );
  }
}
