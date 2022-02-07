import 'package:flutter/material.dart';

class Sdbx1Screen extends StatelessWidget {
  const Sdbx1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sdbx20220204.1'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Widget1(),
            SizedBox(
              height: 8,
            ),
            Widget2(),
          ],
        ),
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
  const Widget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[200],
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'widget1',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class Widget2 extends StatefulWidget {
  const Widget2({Key? key}) : super(key: key);

  @override
  _Widget2State createState() => _Widget2State();
}

class _Widget2State extends State<Widget2> {
  int value = 123;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'widget2',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$value',
              style: const TextStyle(fontSize: 24),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  value = value + 1;
                });
              },
              child: const Text(
                'Add Value',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
