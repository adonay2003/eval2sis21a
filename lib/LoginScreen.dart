
import 'package:eval2sis21a/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '\\Iniciar Sesión//',
        style: TextStyle(color: Color.fromARGB(255, 14, 14, 14)),
      )),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(      
          child: Column(
            children: [
              CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('images/gerson.jpeg'),
                
              ),
              Text(
                'LOGIN',
                style: TextStyle(
                  color: Color.fromARGB(255, 148, 4, 205),fontFamily: 'cursive',fontSize: 50.0
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(
                  color: Color.fromARGB(255, 237, 15, 108),
                ),
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    
                    icon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 58, 191, 21),
                    )),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  
                    labelText: 'Contraseña',
                    icon: Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 217, 49, 2),
                    )),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _signIn,
                child: Text('Ingresar',),
              ),
              SizedBox(height: 10),
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Si el inicio de sesión es exitoso, navega a ProductosScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ProductosScreen()),
      );
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
       
      });
    }
  }
}
