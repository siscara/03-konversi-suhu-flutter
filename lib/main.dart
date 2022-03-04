import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  final temperatureController = TextEditingController();
  @override
  void dispose() {
    temperatureController.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu SiscaDwiRahayu - 2031710003',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sisca Dwi Rahayu (2031710003)"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                controller: temperatureController,
                decoration: const InputDecoration(
                    labelText: "Masukkan Suhu Dalam Celcius"),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    const Text("Suhu dalam Kelvin"),
                    Text(
                      _kelvin.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 32),
                    ),
                  ]),
                  Column(
                    children: [
                      const Text("Suhu dalam Reamur"),
                      Text(
                        _reamur.toStringAsFixed(2),
                        style: const TextStyle(fontSize: 32),
                      ),
                    ],
                  )
                ],
              ),
              MaterialButton(
                onPressed: () {
                  convert();
                },
                child: const Text(
                  "Konversi",
                  style: const TextStyle(fontSize: 24),
                ),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: double.maxFinite,
                padding: const EdgeInsets.all(8),
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  void convert() {
    _inputUser = double.parse(temperatureController.text);
    setState(() {
      _kelvin = _inputUser + 273.15;
      _reamur = _inputUser * 0.8;
    });
  }
}
