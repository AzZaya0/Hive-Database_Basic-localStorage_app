// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var derectory =
      await getApplicationDocumentsDirectory(); //privide the directory to store
  Hive.init(derectory.path); //init the Hive with this line

//open the box In hive the data is stored in box
  var box = await Hive.openBox('mybox');
  //can use => Hive.openBox('mybox') as a refrence
  box.put(1, {'Azzaya': 18, "yoho": "brook"});

  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    );
  }
}
