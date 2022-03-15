// import 'dart:html';
// import 'dart:io';
import 'dart:math';

import 'package:future_app/geolocation.dart';
import 'package:future_app/navigation_dialog.dart';
import 'package:future_app/navigation_first.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'dart:async';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Future Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationDialog(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({Key? key}) : super(key: key);

  @override
  _FuturePageState createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String? result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back From Future'),
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            ElevatedButton(
                child: Text("Sum"),
                onPressed: (){
                  returnFG();
                }
                  ),
            Spacer(),
            Text("${result}"),
            Spacer(),
            CircularProgressIndicator(),
            Spacer()
          ],
        ),
      ),

    );
  }
// FutureGroup  function

  void returnFG(){
    
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());


    // Close Future
    futureGroup.close();
    futureGroup.future.then((List<int>value) {
      int total= 0;
      value.forEach((element) {

        total += element;
      });
      setState(() {
        result = total.toString();
      });

    });

  }

// // Completer Function
//   // First we need to create instance of Completer class:
//   Completer completer = Completer();
//   Future getNum() {
//     // completer = Completer<int>();
//     calculate();
//
//     return completer.future;
//
//   }
//
//   // Calcuate Function
//   calculate() async{
//     try{
//       await Future.delayed(Duration(seconds: 5));
//       return completer.complete(45);
//     }catch(_){
//         completer.completeError(_);
//     };
//   }

  // Widget? _buildCircularProgressIndicator(){ // temporary
  //   return null;
  // }
  // Create a method to Get the data
  // Future<Response> getData()async{
  //   final String authority = 'www.googleapis.com'; // authority = domain name e.g www.relexai.com
  //   final String path= '/books/v1/volumes/junbDwAAQBAJ'; // path = Path where the data we are going to retrieve is located
  //   Uri url = await Uri.https(authority, path);
  //   return http.get(url);

// as we are practicing async/await functions, lets create some functions

  Future<int> returnOneAsync() async{
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async{
    await Future.delayed(Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async{
    await Future.delayed(Duration(seconds: 3));
    return 3;
  }
  //
  // // Now using these three functions we need to calculate the sum and show it on screen.
  // Future getSum() async{
  //   int total= 0;
  //   total = await returnOneAsync();
  //   total += await returnTwoAsync();
  //   total += await returnThreeAsync();
  //
  //   setState(() {
  //     result = total.toString();
  //   });
  // }
  }



