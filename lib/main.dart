import 'package:flutter/material.dart';
import 'package:sdbx/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final data = [
  {
    'label': '1',
    'imgurl': 'assets/images/img1.jpg',
  },
  {'label': '2', 'imgurl': 'assets/images/img2.jpg'},
  {'label': '3', 'imgurl': 'assets/images/img12.jpg'},
  {'label': '3', 'imgurl': 'assets/images/img3.jpg'},
  {'label': '1', 'imgurl': 'assets/images/img4.jpg'},
  {'label': '2', 'imgurl': 'assets/images/img5.jpg'},
  {'label': '3', 'imgurl': 'assets/images/img6.jpg'},
  {'label': '1', 'imgurl': 'assets/images/img7.jpg'},
  {'label': '1', 'imgurl': 'assets/images/img8.jpg'},
  {'label': '2', 'imgurl': 'assets/images/img9.jpg'},
  {'label': '3', 'imgurl': 'assets/images/img10.jpg'},
  {'label': '2', 'imgurl': 'assets/images/img11.jpg'},
];

class _MyHomePageState extends State<MyHomePage> {
  final list = <Map<String, dynamic>>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _constructRow(data) => Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          child: ItemRow(data),
        );
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: SingleChildScrollView(
            child: Column(children: [
              ...data.map((element) {
                return _constructRow(element);
              }).toList()
            ]),
          ),
        ));
  }
}

class ItemRow extends StatefulWidget {
  ItemRow(this.data, {Key? key}) : super(key: key);
  Map<String, dynamic> data;

  @override
  State<ItemRow> createState() => _ItemRowState();
}

class _ItemRowState extends State<ItemRow> {
  bool chosen = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          chosen = !chosen;
        });
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black26,
            border: Border.all(
                color: chosen ? Colors.amber : Colors.blue, width: 5),
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width < 600 ? 100 : 300,
                child: widget.data.containsKey('imgurl')
                    ? Image.asset(widget.data['imgurl'])
                    : Container(
                        width: 50,
                        height: 50,
                        color: Colors.red,
                      ),
              ),
              SizedBox(
                width: 24,
              ),
              Text(
                widget.data['label'],
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
              Spacer(),
              Center(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailsScreen(widget.data['imgurl'])));
                    },
                    icon: Icon(
                      Icons.chevron_right,
                      size: 40,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
