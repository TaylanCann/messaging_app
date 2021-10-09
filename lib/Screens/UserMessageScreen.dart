import 'package:flutter/material.dart';

class UserMessageScreen extends StatefulWidget {
  
  String title;
  List<String> Messages =[];
  
  UserMessageScreen({Key? key,required this.title}) : super(key: key);

  @override
  _UserMessageScreenState createState() => _UserMessageScreenState();
}

class _UserMessageScreenState extends State<UserMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage:
               AssetImage('Assets/DefaultPP.png'),
              backgroundColor: Colors.transparent,),
            SizedBox(width: 15,),
            Text(widget.title),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/WpDefaultBack.jpg'),
            fit: BoxFit.fill
          ),
        ),
      ),
    );
  }
}
