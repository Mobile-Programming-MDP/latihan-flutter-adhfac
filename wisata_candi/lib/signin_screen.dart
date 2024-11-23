import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String _errorText = '';
  bool _isSignedIn = false;

  void _signIn() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedUsername = prefs.getString('username') ?? '';
    final String savedPassword = prefs.getString('password') ?? '';
    final String enteredUsername = _usernameController.text.trim();
    final String enteredPassword = _passwordController.text.trim();

    if (enteredUsername.isEmpty || enteredPassword.isEmpty){
      setState(() {
        _errorText = 'Nama pengguna dan kata sandi harus diisi';
      });
      return;
    } else if (savedPassword.isEmpty || savedUsername.isEmpty){
      setState(() {
        _errorText = 'Pengguna belum terdaftar';
      });
      return;
    } else if (enteredUsername == savedUsername && enteredPassword == savedPassword){
      setState(() {
        _errorText = '';
        _isSignedIn = true;
        prefs.setBool('isSignedIn', true);
      });

      // Pemanggilan untuk menghapus semua halaman dalam Tumpukan navigasi
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      });

      // Sign in berhasil, navigation ke layar utama
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/');
      });
    } else {
      setState(() {
        _errorText = 'Nama pengguna atau kata sandi salah';
      });
    }
  }

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
                    onPressed: _signIn,
                    child: const Text('Sign In',  style: TextStyle(fontFamily: 'Cascadia'))
                  ),
                  const SizedBox(height: 20,),
                  RichText(text: TextSpan(
                    text: 'Belum punya akun?',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.deepPurple
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Daftar di sini!',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16
                        ),
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Navigator.pushNamed(context, '/signup');
                        },
                      )
                    ]
                  ))
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}