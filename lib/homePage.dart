// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final _mybox = Hive.box('mybox');
  final _textcontroller = TextEditingController(); // to control the text filed

  void WriteTextdata() {
    _mybox.put('textInput', _textcontroller.text);
    setState(() {});
  }

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
            Container(
              child: (_mybox.get('textInput') == null)
                  // If data is null
                  ? Text('')
                  : Text(_mybox
                      .get('textInput')
                      .toString()), //to show the data from database
            ),
            Container(
                padding: EdgeInsets.all(12),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _textcontroller,
                        decoration: InputDecoration(
                            hintText: "write here",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _textcontroller.clear();
                              },
                              icon: Icon(Icons.clear),
                            )),
                      ),
                    ])),
            MaterialButton(
              onPressed: WriteTextdata,
              child: Text(
                'Write From TextField',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.pink,
            ),
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
