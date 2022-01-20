import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        // child: Image.network(
        //   'https://lh3.googleusercontent.com/Vqbe9lOx9R8TBag0QeUBCFuQC5LmsuP4lVGTcHacCOTMlgbnBeCIKn9POrGRwYyVe_o0VyIfKYqw9L2S3OczDa4DU7VuRcFQvzJk4eaVLyZaTTmKS86pJMeZYebHxSiDciRvPU0tgQe5IQhUysOFLvK75A2FvzXAuuiJ4syro1IfmazPCwTAvmRgqATolAqqHG84gTlcpltuSvs9lWpnm-eRkhxwLO1RsPF2R0Q6xN0hqK5V4jMNtKLUjNLLbEtcU39pX--HJFMJNHc1yD9obD1jM4wTmmqNMc3lvhBR0WdCwd9CnKnRZzWdpj49J35hJsCSDRONHve94-GQLpQqtZCGnZqDBKjjvTT4k6TPpLQ3beAtmqcDIr_fb-FrLQBrQoRSc_8h5e-_2JXfSjpvPsQ4Rz85EfTZofl6k966UO03gDMGzUwTMh5m_6c9Kx2Osx0QJwnHaLeUeHSCmckZE9tsZYpaDrM8TsULj7jQHrwRPiCfYCLkrFBzPK3c6yzHxXsWIadOkUpVpYnV8bnG9iurcuIBKSE_MnH2zFgTqnrRWrEEXKbbVwaoumrNTyr_AjwICFPnlQA-abQsj086DABcK_rwDY6MHE5Zq2BcQYv_y5u6VBTwJJXgaNHPrCLJhGzky2ygjJ99Au7h8gPIi9ZaMYOmCa8bze1ZTgpqJOEIONaYxlQZgQ5bmTtp94qGjYRdQBNx6u9wg7nMrJwXYgDm=w1052-h1712-no?authuser=0',
        // ),
        child:QrImage(
  data: "https://lh3.googleusercontent.com/6wHtVujNkw2h44P0TJpv3HKYcgMmZUOjPbnY0GNirmjviDzrJBqXHV4zTpaFJySSuwyPpAkpaJoF1aJgbTxaHOVxqeGqCu1sw14Z7jfqoTGfcSm37j9jAVtfnMI8cBzIuHQnTntllfNSDTa-R12srblkZmt_MeG40YA1xbsJKwSTQLh3MU16g5j6hvfkoOaBD4mNu4yQ7JPzX_1XUTEtCrGgUhK55gRqZSEuBj5xljYK1o3mAFuqhk6j5JQ16oc2XVuxbwIe4xPAjF-zyP41iz5Dy3vYy0VEWsMwPMEPfTqMG7l1YmujZM9ryjqQppJV5xBiqxPUkoKXjqP23mUbRsKzygiicKefYvbYusmXW2G1dRKbGhWdX5vzfO840G_GcC-HE1KbyjcgfmpYhTDxo8zUAz9G6m3Qvfx8whGlGqUH29686S-RPOnOu0uTjB9DOcHURdS0P16neZowEfLEE54Q-0fHCPwFeQmJXVMqQ95TLchkBTWv96fnGkGZciOFGzN0a5q_frTszXhGbns1iwXhRlrORRiDLe_KiDx2EHKDFYqjznD_zxSFCuROi4gFHmKXnHWycnLNZz3ZEzLChugP7p1UXg-c4BZqmc2-Tz1MjVCVYSsIFZnTyoUXu953RiyeKXM-XFqih2AMDbyJgG8AfkeowJwvjLLibWBQ5_c5499vkXoAkdB_HZl1AbYa9xRGnyowAUR5dEleGs0z2tql=w1284-h1712-no?authuser=0",
  version: QrVersions.auto,
  size: 200.0,
) ,
      ),
    );
  }
}
