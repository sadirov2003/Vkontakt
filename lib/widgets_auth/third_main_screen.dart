import 'package:flutter/material.dart';

class ThirdMainScreen extends StatefulWidget {
  @override
  _ThirdMainScreenState createState() => _ThirdMainScreenState();
}

class _ThirdMainScreenState extends State<ThirdMainScreen> {
  String? errorText;
  final _passwordTextController = TextEditingController(text: 'admin');
  final password = '';

  void _auth() {
    final password = _passwordTextController.text;
    if (password == 'admin') {
      Navigator.pushNamed(context, '/myVkPage');
      errorText = null;
    } else if (password.isEmpty) {
      errorText = 'Вводите пароль!';
    } else {
      errorText = 'Неправильный пароль!';
    }
    setState(() {
      this.errorText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 100),
            ImageIcon(
              AssetImage('assets/25684.png'),
              size: 30,
            ),
            SizedBox(width: 5),
            Text('ID', style: TextStyle(fontSize: 20))
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageIcon(
                          AssetImage('assets/25684.png'),
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Введите пароль',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Ibarra',
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 23,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text:
                            'Используйте пароль, указанный при регистрации с ',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Ibarra',
                          color: Colors.black54,
                        ),
                      ),
                      TextSpan(
                        text: '+7 950 547-20-04',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  if (errorText != null) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.red,
                        ),
                        SizedBox(width: 5),
                        Text(
                          errorText!,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                  ],
                  TextField(
                    controller: _passwordTextController,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      hintText: 'Введите пароль',
                      labelStyle: TextStyle(color: Colors.black54),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white38,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Забыли или не установили пароль?',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      surfaceTintColor: Colors.black,
                    ),
                    onPressed: _auth,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        child: Text('Продолжать',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold)),
                        alignment: Alignment.center,
                        width: 450,
                        height: 47,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
