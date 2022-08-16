import 'package:flutter/material.dart';

class FirstMainScreen extends StatelessWidget {
  const FirstMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ImageIcon(
            AssetImage('assets/25684.png'),
            size: 30,
          ),
          SizedBox(width: 6),
          Text('вконтакте', style: TextStyle(fontSize: 22))
        ]),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text('Вход ВКонтакте',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                'Мобильная версия поможет вам оставаться ВКонтакте, даже если вы далеко от компьютера.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/secondMainScreen');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    child: Text(
                      'Войти',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment.center,
                    width: 450,
                    height: 47,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Зарегистрироваться',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                  ),
                  alignment: Alignment.center,
                  width: 450,
                  height: 47,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'После регистрации вы получите доступ ко всем возможностями VK ID',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_right_outlined,
                      color: Colors.black54,
                    ),
                    label: Text(
                      'Узнать больше',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 19,
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
