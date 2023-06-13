import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Alignment _alignment = Alignment.centerLeft;

  late bool _isActive;

  @override
  void initState() {
    _isActive = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double wh = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              alignment: _alignment,
              onEnd: () {
                setState(() {
                  _isActive = true;
                });
              },
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.green),
                ),
              ),
              duration: const Duration(seconds: 1),
              child: Container(
                width: wh * 0.3,
                height: wh * 0.3,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _isActive && _alignment != Alignment.centerLeft
                        ? () {
                            setState(() {
                              _alignment = Alignment.centerLeft;
                              _isActive = false;
                            });
                          }
                        : null,
                    child: const Text('Влево'),
                  ),
                  ElevatedButton(
                    onPressed: _isActive && _alignment != Alignment.centerRight
                        ? () {
                            setState(() {
                              _alignment = Alignment.centerRight;
                              _isActive = false;
                            });
                          }
                        : null,
                    child: const Text('Вправо'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
