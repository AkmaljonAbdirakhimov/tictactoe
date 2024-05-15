import 'package:flutter/material.dart';
import 'package:tictactoe/pages/game_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String emailError = "";
  String passwordError = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // prefix: Icon(Icons.email),
                prefixIcon: const Icon(Icons.email),
                suffixIcon: const Icon(Icons.remove_red_eye),
                label: const Text("Email address"),
                hintText: "Email address",
                error: emailError.isNotEmpty ? Text(emailError) : null,
                // fillColor: Colors.blue,
                // filled: true,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: "*",
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // prefix: Icon(Icons.email),
                prefixIcon: const Icon(Icons.password),
                suffixIcon: const Icon(Icons.remove_red_eye),
                label: const Text("Password"),
                hintText: "Password",
                error: passwordError.isNotEmpty ? Text(passwordError) : null,
                // fillColor: Colors.blue,
                // filled: true,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String email = emailController.text;
                  String password = passwordController.text;

                  if (email.isEmpty) {
                    emailError = "Iltimos email kiriting";
                  } else if (!email.contains("@")) {
                    emailError = "Iltimos to'g'ri email kiriting";
                  } else {
                    emailError = "";
                  }
                  if (password.isEmpty) {
                    passwordError = "Iltimos password kiriting";
                  } else {
                    passwordError = "";
                  }

                  setState(() {});

                  print(email);
                  print(password);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text("LOGIN"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactsList extends StatefulWidget {
  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  bool show = true;
  String phone = "+998 90 123 45 67";

  @override
  void dispose() {
    print("Contact Sahifasi o'chirildi!");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("36-Dars"),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              // show = !show;
              // phone = phone == "+998 88 888 88 88"
              //     ? "+998 90 123 45 67"
              //     : "+998 88 888 88 88";
              // setState(() {});
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) {
                    return GamePage();
                  },
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
          show
              ? Contact(phone)
              : Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.red,
                  child: Contact(phone),
                ),
        ],
      ),
    );
  }
}

class Contact extends StatefulWidget {
  final String phone;

  Contact(this.phone);

  @override
  State<Contact> createState() {
    return _ContactState();
  }
}

class _ContactState extends State<Contact> {
  final controller = TextEditingController();
  late String contactName;

  @override
  void initState() {
    super.initState();

    // print("${widget.phone} Init ishladi");
    contactName = "Tom Jerry";
  }

  // @override
  // void activate() {
  //   print("${widget.phone} Contact aktivlashdi");

  //   super.activate();
  // }

  // @override
  // void deactivate() {
  //   print("${widget.phone} Contact uxlayapdi");

  //   super.deactivate();
  // }

  // @override
  // void didUpdateWidget(covariant Contact oldWidget) {
  //   super.didUpdateWidget(oldWidget);

  //   print("Contact o'zgardi");
  // }

  // @override
  // void dispose() {
  //   print("${widget.phone} Yo'q qilindi");
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    print("${widget.phone} Build ishladi");
    return Card(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Text(
              contactName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              widget.phone,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
