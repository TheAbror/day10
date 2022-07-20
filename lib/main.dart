import 'package:day10/data_services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomePage> {
  final _dataService = DataService();
  String? _response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Builder(builder: (_) {
              if (_response != null) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    _response ?? "Error",
                    style: TextStyle(fontSize: 12),
                  ),
                );
              }
              return TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: makeRequest,
                child: Text("data"),
              );
            }),
          ),
        ),
      ),
    );
  }

  void makeRequest() async {
    final response = await _dataService.makeRequestToApi();
    setState(() {
      _response = response.toString();
    });
  }
}
