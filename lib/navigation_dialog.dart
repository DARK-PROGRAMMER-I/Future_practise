import 'package:flutter/material.dart';

class NavigationDialog extends StatefulWidget {
  const NavigationDialog({Key? key}) : super(key: key);

  @override
  _NavigationDialogState createState() => _NavigationDialogState();
}

class _NavigationDialogState extends State<NavigationDialog> {
  Color? color = Colors.blueAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color ,
        title: Text('Navigation Dialog Screen'),
      ),
      body: Container(
        // color: color,
        child: Center(
          child: ElevatedButton(
            child: Text("Change Color"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color)
            ),
            onPressed: (){
              _buildShowDialog(context);
            },
          ),
        ),
      ),
    );
  }
  _buildShowDialog(BuildContext context)async{
    color = null;
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_){
          return AlertDialog(
            title: Text("Very Important Message"),
            content: Container(
              child: Wrap(


                children: [
                  _buildColorNavigation(context, "Red", Colors.red[700]),
                  SizedBox(width: 10,),
                  _buildColorNavigation(context, "grey", Colors.grey[700]),
                  SizedBox(width: 10,),
                  _buildColorNavigation(context, "blue", Colors.blueAccent),
                  SizedBox(width: 10,),
                  _buildColorNavigation(context, "orange", Colors.orange[700]),
                  SizedBox(width: 10,),
                  _buildColorNavigation(context, "pink", Colors.pink[700]),


                ],
              ),
            ),

          );

        },
    );
    
  }

  Widget _buildColorNavigation(BuildContext context, String text, Color? setColor){
    return ElevatedButton(
        onPressed: (){
          Navigator.pop(context);
          setState(() {
            color = setColor;
          });
        },
        child: Text(text));
  }
}
