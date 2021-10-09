import 'package:flutter/material.dart';
import 'package:messaging_app/Screens/UserMessageScreen.dart';

class MainScreen extends StatefulWidget {

  String title;
  List<String> MainScreenPeople =['Kullanıcı1','Kullanıcı2','Kullanıcı3','Kullanıcı4','Kullanıcı5',
    'Kullanıcı6','Kullanıcı7','Kullanıcı8','Kullanıcı9','Kullanıcı10'];

  MainScreen({Key? key, required this.title}) : super(key: key);


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:ListView.builder(itemBuilder: (context,i){
        return Card(
          child: ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> UserMessageScreen(title: widget.MainScreenPeople[i])));
            },
            subtitle: Text("sda"),
            title: Text(widget.MainScreenPeople[i]),
            leading:  CircleAvatar(
              radius: 25.0,
              backgroundImage:
              AssetImage('Assets/DefaultPP.png'),
              backgroundColor: Colors.transparent,),
          ),
        );
      },itemCount: widget.MainScreenPeople.length,),
    );
  }
}
