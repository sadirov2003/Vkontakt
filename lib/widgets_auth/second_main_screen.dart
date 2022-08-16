import 'package:flutter/material.dart';

class SecondMainScreen extends StatefulWidget {
  @override
  _SecondMainScreenState createState() => _SecondMainScreenState();
}

class _SecondMainScreenState extends State<SecondMainScreen> {
  String? errorText;
  final _loginTextController = TextEditingController(text: '89505472004');
  final login = '';

  void _auth() {
    final login = _loginTextController.text;
    if (login == '89505472004') {
      Navigator.pushNamed(context, '/thirdMainScreen');
      errorText = null;
    } else if (login.isEmpty) {
      errorText = 'Вводите логин!';
    } else {
      errorText = 'Аккаунт не найден!';
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
          //mainAxisAlignment: MainAxisAlignment.center,
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
                  Text('Введите номер',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Ibarra',
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 23,
                  ),
                  Text(
                    'Ваш номер телефона будет использоваться для входа в аккаунт',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Ibarra',
                      color: Colors.black54,
                    ),
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
                    controller: _loginTextController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      hintText: 'Телефон или почта',
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
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
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
                  SizedBox(height: 20),
                  Text(
                    'Нажимая <<Продолжить>>, вы принимаете пользовательское соглашение и политику конфиденциальности',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Передаваемые данные',
                    ),
                    icon: Icon(Icons.chevron_right_outlined),
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
