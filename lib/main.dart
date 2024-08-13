import "package:flutter/material.dart";
import 'package:math_expressions/math_expressions.dart';
import 'package:random_app/colors.dart';
import 'package:random_app/recipe.dart';
// import 'package:random_app/music.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes: {
        'homeLogin': (context) => const HomePage(),
        'todoPage': (context) => const ToDoPage(),
        'calculatePage' : (context) => const CalculatePage(),
        'recipePage' : (context) => const RecipeApp(),
        // 'musicPage' : (context) => MusicPage(),
      },
    );
  }
}

class CalculatePage extends StatelessWidget {
  const CalculatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculate',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Calculator_App(),
    );
  }
}

// ignore: camel_case_types
class Calculator_App extends StatefulWidget {
  const Calculator_App({super.key});


  @override
  State<Calculator_App> createState() => _Calculator_AppState();
}

// ignore: camel_case_types
class _Calculator_AppState extends State<Calculator_App> {
  //Variables
  double firstnumber = 0.0;
  double secondnumber = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 34.0;

  onButtonClick(value) {
    //if value is AC
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll('X', '*');
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideInput = true;
        outputSize = 52.0;
      }
    } else {
      input = input + value;
      hideInput = false;
      outputSize = 34.0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Menu Kalkulator', style: TextStyle(fontSize: 18.0),),
      ),
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          //Input and output area
          Expanded(
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        hideInput ? '' : input,
                        style: const TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        output,
                        style: TextStyle(
                          fontSize: outputSize,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  )
              )
          ),
          Row(children: [
            button(
                text: 'AC', buttonBGcolor: operatorcolor, tColor: orangecolor),
            button(
                text: '<', buttonBGcolor: operatorcolor, tColor: orangecolor),
            // button(text: '', buttonBGcolor: Colors.transparent),
            button(
                text: '/', buttonBGcolor: operatorcolor, tColor: orangecolor),
          ]),
          Row(children: [
            button(text: '7'),
            button(text: '8'),
            button(text: '9'),
            button(
                text: 'X', tColor: orangecolor, buttonBGcolor: operatorcolor),
          ]),
          Row(children: [
            button(text: '4'),
            button(text: '5'),
            button(text: '6'),
            button(
                text: '-', tColor: orangecolor, buttonBGcolor: operatorcolor),
          ]),
          Row(children: [
            button(text: '1'),
            button(text: '2'),
            button(text: '3'),
            button(
                text: '+', tColor: orangecolor, buttonBGcolor: operatorcolor),
          ]),
          Row(children: [
            button(
                text: '%', tColor: orangecolor, buttonBGcolor: operatorcolor),
            button(text: '0'),
            button(text: '.'),
            button(text: '=', buttonBGcolor: orangecolor),
          ]),
        ],
      ),
    );
  }

  Widget button({text, tColor = Colors.white, buttonBGcolor = buttonColor}) {
    return Expanded(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(22),
                // ignore: deprecated_member_use
                primary: buttonBGcolor,
              ),
              onPressed: () => onButtonClick(text),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: tColor,
                  fontWeight: FontWeight.bold,
                ),
              )
          ),
        )
    );
  }
}



class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo'),
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/todo.jpeg',
              width: 200.0,
              height: 200.0,
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),

      child : ListView(
        children: [
          Center(
            child: Image.asset(
              'assets/images/images.jpeg',
              width: 250.0,
              height: 210.0,
            ),
          ),
          const SizedBox(height: 4.0),
          const Center(
          child: Text('Selamat Datang di Aplikasiku',
              style: TextStyle(fontSize: 18.0)
          ),
          ),

          const SizedBox(height: 12.0),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ToDoPage()),
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/todo.jpeg',
                    width: 100.0,
                    height: 100.0,
                  ),

                  const SizedBox(height: 12.0),
                  const Text('Menu ToDo',
                    style: TextStyle(fontSize: 16.0),)
                    ],
                  ),
            ),
          ),


          const SizedBox(height: 16.0),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecipeApp()),
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/tabung.jpg',
                    width: 100.0,
                    height: 100.0,
                  ),

                  const SizedBox(height: 12.0),
                  const Text('Menu Recipe',
                    style: TextStyle(fontSize: 16.0),)
                ],
              ),

            ),
          ),


          const SizedBox(height: 16.0),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CalculatePage()),
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/kalkulator.png',
                    width: 100.0,
                    height: 100.0,
                  ),

                  const SizedBox(height: 12.0),
                  const Text('Menu Calculate',
                    style: TextStyle(fontSize: 16.0),)
                ],
              ),

            ),
          ),

          const SizedBox(height: 16.0),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ToDoPage()),
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/music.jpg',
                    width: 100.0,
                    height: 100.0,
                  ),

                  const SizedBox(height: 12.0),
                  const Text('Menu MusicPlayer',
                    style: TextStyle(fontSize: 16.0),)
                ],
              ),

            ),
          ),

          const SizedBox(height: 12.0),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ToDoPage()),
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/buku.jpg',
                    width: 100.0,
                    height: 100.0,
                  ),

                  const SizedBox(height: 12.0),
                  const Text('Menu Novel Recommended',
                    style: TextStyle(fontSize: 16.0),)
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



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';

  void _login() {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Email dan Password Harus Diisi, bebas yang penting isi walaupun huruf atau angka';
      });
      return;
    }
    Navigator.pushReplacementNamed(context, 'homeLogin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _errorMessage,
              style: const TextStyle(color: Colors.redAccent),
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
    );
  }
}
