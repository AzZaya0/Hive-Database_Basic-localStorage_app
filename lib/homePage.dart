// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final _mybox = Hive.box('mybox');

  void Writedata() {
    _mybox.put(2, {'Azzaya1': 181, "yoho1": "brook1"});
    _mybox.put(1, {'Azzaya': 18, "yoho": "brook"});
    setState(() {});
  }

  void Readdata() {
    _mybox.get(1);
    print(_mybox.get(1));
  }

  void Deletedata() {
    _mybox.delete(1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: Writedata,
              child: Text(
                'Write',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.pink,
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: Readdata,
              child: Text(
                'Read',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.pink,
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: Deletedata,
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.pink,
            ),
            Text('Hello there'),
            FutureBuilder(
              future: Hive.openBox('mybox'),
              builder: (context, snapshot) {
                if (!snapshot.hasData || _mybox.get(1) == null) {
                  // If no data available or data is null
                  return Text('No data');
                } else {
                  // Data is available
                  return Column(
                    children: [
                      Text(_mybox.get(1).toString()),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
