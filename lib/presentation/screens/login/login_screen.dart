import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_from_basic/presentation/screens/basic_screen.dart';
import 'package:learn_flutter_from_basic/presentation/screens/register_screen.dart';
import 'package:learn_flutter_from_basic/service/user_service.dart';

import 'blocs/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var username = "";
  var password = "";
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider( /// menyediakan / mengintegrasikan blocc kedalam widget flutter supaya di gunakan
      create: (context) => LoginBloc(userService: UserService()),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Login Screen"),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text("Silahkan Login"),
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
                        decoration: const InputDecoration(label: Text(
                            "Username")),
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        onSaved: (val) {
                          password = passwordController.text;
                          passwordController.text = "";
                        },
                        decoration: const InputDecoration(label: Text(
                            "Password")),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Belum Punya Akun? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Daftar Disini.",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      BlocConsumer<LoginBloc, LoginState>( // supaya widget nya berubah, sesuai dengan value state dari blocc
                        listener: (context, state){
                          if(state is LoginSuccess){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (
                                    context) => const BasicScreen(),
                              ),
                            );
                          }
                        },

                        builder: (context, state) {
                          // mengakses bloc yang sudah disediakan oleh widget BlocProvider
                          var loginBloc = context.read<LoginBloc>();
                          if(state is LoginLoading){
                            return Column(
                              children: const [
                                ElevatedButton(
                                    onPressed: null,
                                    child: const Text("Login")),
                                const SizedBox(
                                  height: 32,
                                ),
                                const CircularProgressIndicator(),
                              ],
                            );
                          }
                          if(state is LoginSuccess){
                            return Column(
                              children: [
                                ElevatedButton(
                                    onPressed: () async {
                                      if ((formKey.currentState?.validate() ??
                                          false)) {
                                        formKey.currentState?.save();

                                        /// Logic authentication dengan hive
                                        loginBloc.add(UserLoginEvent(username, password));
                                      }
                                    },
                                    child: const Text("Login")),
                                const SizedBox(
                                  height: 32,
                                ),
                                const Text("Login Berhasil"),
                              ],
                            );
                          }
                          if(state is LoginFailed){
                            return Column(
                              children: [
                                ElevatedButton(
                                    onPressed: () async {
                                      if ((formKey.currentState?.validate() ??
                                          false)) {
                                        formKey.currentState?.save();

                                        /// Logic authentication dengan hive
                                        loginBloc.add(UserLoginEvent(username, password));
                                      }
                                    },
                                    child: const Text("Login")),
                                const SizedBox(
                                  height: 32,
                                ),
                                const Text("Login Gagal"),
                              ],
                            );
                          }
                          return ElevatedButton(
                              onPressed: () async {
                                if ((formKey.currentState?.validate() ??
                                    false)) {
                                  formKey.currentState?.save();

                                  /// Logic authentication dengan hive
                                  loginBloc.add(UserLoginEvent(username, password));
                                }
                              },
                              child: const Text("Login"));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
