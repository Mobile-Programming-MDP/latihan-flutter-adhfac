import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In'),),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: const TextStyle(
                        fontFamily: 'Cascadia'
                      ),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.abc))
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      labelStyle: const TextStyle(
                        fontFamily: 'Cascadia'
                      ),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility))
                    ),
                    obscureText: _obscurePassword,
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {}, 
                    child: const Text('Sign In',  style: TextStyle(fontFamily: 'Cascadia'))
                  )
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}