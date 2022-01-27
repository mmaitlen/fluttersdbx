import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(this.url, {Key? key}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details!"),
        ),
        body: Column(
          children: [
            Image.asset(url),
            const SizedBox(
              height: 16,
            ),
            const ClickMeWidget(),
          ],
        ));
  }
}

class ClickMeWidget extends StatefulWidget {
  const ClickMeWidget({
    this.initialValue = 123,
    Key? key,
  }) : super(key: key);
  final int initialValue;

  @override
  State<ClickMeWidget> createState() => _ClickMeWidgetState();
}

class _ClickMeWidgetState extends State<ClickMeWidget> {
  late int value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {
            setState(() {
              value = value + 1;
            });
          },
          child: const Text('Click Me'),
          key: const Key('clickbtn'),
        ),
        const SizedBox(width: 24),
        Text(
          '$value',
          key: const Key('textvalue'),
        ),
      ],
    );
  }
}
