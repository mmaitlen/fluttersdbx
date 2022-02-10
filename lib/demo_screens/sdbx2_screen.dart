import 'package:flutter/material.dart';

/// create widget to display leading bullet and bold text
/// spread operator into map into list
/// use RichText to define bold leading text style and normal/unbolded style for body

List<List<String>> copy = [
  [
    'Leading text 1',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  ],
  [
    'Leading text 2',
    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  ],
  [
    'Leading text 3',
    'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ],
];

class Sdbx2Screen extends StatelessWidget {
  const Sdbx2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sdbx2',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...copy
                .map(
                  (e) => LeaderAndBodyWidget(
                    leader: e[0],
                    body: e[1],
                    showBullet: false,
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}

class LeaderAndBodyWidget extends StatelessWidget {
  const LeaderAndBodyWidget({
    required this.leader,
    required this.body,
    this.showBullet = true,
    Key? key,
  }) : super(key: key);
  final String leader;
  final String body;
  final bool showBullet;
  static const _bullet = '\u2022';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: " ${showBullet ? _bullet : ''} $leader ",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: body,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ]),
      ),
    );
  }
}
