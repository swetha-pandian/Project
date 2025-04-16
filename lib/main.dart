import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: LoginPage()));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController _emailController;
  late AnimationController _passwordController;

  late Animation<Offset> _emailAnimation;
  late Animation<Offset> _passwordAnimation;

  final TextEditingController emailText = TextEditingController();
  final TextEditingController passwordText = TextEditingController();

  @override
  void initState() {
    super.initState();

    _emailController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _passwordController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _emailAnimation = Tween<Offset>(
      begin: Offset(1.5, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _emailController, curve: Curves.easeOutBack),
    );

    _passwordAnimation = Tween<Offset>(
      begin: Offset(-1.5, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _passwordController, curve: Curves.easeOutBack),
    );

    _emailController.forward().then((_) {
      _passwordController.forward();
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    String email = emailText.text;
    String password = passwordText.text;

    if (email.isEmpty || password.isEmpty) {
      _showDialog("Login Info", "Email or password cannot be empty");
      return;
    }

    if (!email.contains("@") || !email.contains(".com")) {
      _showDialog("Login Info", "Invalid Email Format!!");
      return;
    }

    _showDialog("Login Info", "Login Successful!");
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.5, 0.7, 0.8, 0.9],
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade600,
              Colors.blue.shade400,
              Colors.blue.shade200,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _emailAnimation,
                child: SizedBox(
                  width: 400,
                  child: TextField(
                    controller: emailText,
                    decoration: InputDecoration(
                      labelText: "Email ID",
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SlideTransition(
                position: _passwordAnimation,
                child: SizedBox(
                  width: 400,
                  child: TextField(
                    controller: passwordText,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(onPressed: _handleLogin, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
