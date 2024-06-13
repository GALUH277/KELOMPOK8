import 'package:flutter/material.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/screen/admin/dashbord_admin.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key); // Perbaiki constructor

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo1.png'),
                ),
              ),
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                left: 20,
                bottom: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      validator: (value) =>
                      value?.isEmpty ?? true ? 'Username tidak boleh kosong' : null,
                      style: TextStyle(
                        color: Asset.colorPrimaryDark,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(
                          color: Asset.colorPrimaryDark,
                        ),
                        filled: true,
                        fillColor: Asset.colorAccent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Asset.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Asset.colorPrimary,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Asset.colorPrimary,
                            width: 1,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.people,
                          color: Asset.colorPrimaryDark,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) =>
                      value?.isEmpty ?? true ? 'Password tidak boleh kosong' : null,
                      style: TextStyle(
                        color: Asset.colorPrimaryDark,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Asset.colorPrimaryDark,
                        ),
                        filled: true,
                        fillColor: Asset.colorAccent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Asset.colorPrimaryDark,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Asset.colorPrimary,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Asset.colorPrimary,
                            width: 1,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Asset.colorPrimaryDark,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Asset.colorSecondary,
                      ),
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          // Lakukan autentikasi
                          if (_formKey.currentState!.validate()) {
                            String username = _usernameController.text;
                            String password = _passwordController.text;

                            // Navigasi ke halaman Dashboard Admin dengan mengirim username
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashboardAdmin(username: username),
                              ),
                            );
                          }
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 18,
                              color: Asset.colorAccent,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
