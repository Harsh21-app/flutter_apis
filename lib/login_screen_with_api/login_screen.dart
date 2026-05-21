import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
 final emailController = TextEditingController();
 final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           TextFormField(
             controller: emailController,
             textAlign: TextAlign.center,
             decoration: InputDecoration(
               hintText: 'Email',
               border: OutlineInputBorder(),
             ),
             style: TextStyle(
               fontSize: 15
             ),
           ),
          SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder()
            ),
            style: TextStyle(
                fontSize: 15
            ),
          ),
          SizedBox(height: 24,),
          ElevatedButton(onPressed: (){}
              , child: Text('Login'))
        ],
      ),
    );
  }
}
