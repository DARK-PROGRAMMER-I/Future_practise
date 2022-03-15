import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({Key? key}) : super(key: key);

  @override
  _NavigationSecondState createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color? color;
    return Scaffold(

      appBar:AppBar(
        title: Text("Navigation Second Page"),
      ) ,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildColor(context, "red", Colors.red[700] ),
              _buildColor(context, "green", Colors.green[700]),
              _buildColor(context, "orange", Colors.orange[700]),
              _buildColor(context, "purple", Colors.purple[700]),
              _buildColor(context, "gray", Colors.grey[700]),


            ],
          ),
        ),
      ),
    );
  }
  Widget _buildColor(BuildContext context, String text, Color? setColor){
    return ElevatedButton(
        onPressed: (){
          setColor = setColor;
          Navigator.pop(context, setColor);
        },
        child: Text(text));
  }
}
