import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _obscurePassword = true;

  //TODO: 1. Membuat fungsi _signUp
  void _signUp(){
    String name = _nameController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (
      password.length < 8 || 
      !password.contains(RegExp(r'[A-Z]')) || 
      !password.contains(RegExp(r'[0-9]')) || 
      !password.contains(RegExp(r'[a-z]')) ||
      !password.contains(RegExp(r'[!@#%^&*()_+-=<>?]')) ||
      password.contains(RegExp(r'\s'))
    ){
      setState(() {
        _errorText = 'Minimal 8 karakter tanpa spasi, kombinasi [A-Z], [a-z], [0-9], [!@#%^&*()_+-=<>?]';
      });
    } else {
      setState(() {
        _errorText = '';
      });
      print('Berhasil');
    }
  }

  // TODO 2: Membuat fungsi dispose
  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up', style: TextStyle(fontFamily: 'Cascadia'),),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    style: TextStyle(fontFamily: 'Cascadia'),
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        fontFamily: 'Cascadia'
                      ),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.abc))
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    style: TextStyle(fontFamily: 'Cascadia'),
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        fontFamily: 'Cascadia'
                      ),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.abc))
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    style: TextStyle(fontFamily: 'Cascadia'),
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      labelStyle: const TextStyle(
                        fontFamily: 'Cascadia'
                      ),
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: (){
                            setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        }, 
                        icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off)
                      )
                    ),
                    obscureText: _obscurePassword,
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (_signUp),
                    child: const Text('Sign Up',  style: TextStyle(fontFamily: 'Cascadia'))
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