import 'dart:math';

import 'package:flutter/material.dart';
import 'package:messaging_app/Helpers/Globals.dart';
import 'package:messaging_app/Models/Messages.dart';

class UserMessageScreen extends StatefulWidget {
  List<Messages> messages = [];

  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  String title;

  UserMessageScreen({Key? key, required this.title}) : super(key: key);

  @override
  _UserMessageScreenState createState() => _UserMessageScreenState();
}

class _UserMessageScreenState extends State<UserMessageScreen> {
  TextEditingController inputController = TextEditingController();
  FocusNode focusNode = FocusNode();
  ScrollController _scrollController = Globals().scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var rng = new Random();
    for (int i = 0; i < rng.nextInt(50); i++) {
      Messages msg = Messages();
      var rng = new Random();
      msg.from = rng.nextInt(2);
      msg.text = widget.getRandomString(rng.nextInt(30));
      widget.messages.add(msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage('Assets/DefaultPP.png'),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: 15,
            ),
            Text(widget.title),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/Black.png'), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (context, i) {
                      return ListTile(
                          title: widget.messages[i].from != 1
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  80),
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                              child: SelectableText(
                                                widget.messages[i].text,
                                                style: TextStyle(fontSize: 22),
                                              )),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(18),
                                              topLeft: Radius.circular(18),
                                              bottomLeft: Radius.circular(18),
                                              bottomRight: Radius.circular(0),
                                            ),
                                          )),
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  80),
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                              child: SelectableText(
                                                widget.messages[i].text,
                                                style: TextStyle(fontSize: 22),
                                              )),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(18),
                                              topLeft: Radius.circular(18),
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(18),
                                            ),
                                          )),
                                    )
                                  ],
                                ));
                    },
                    itemCount: widget.messages.length),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: TextFormField(
                          controller: inputController,
                          onTap: () {
                            setState(() {
                              Globals().useTimer();
                            });
                          },
                          focusNode: focusNode,
                          minLines: 1,
                          maxLines: 3,
                          decoration: TaylanTextDeco.txtDec(context),
                        ),
                        width: 300,
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            gradient: LinearGradient(
                                begin: Alignment(
                                    0.6702184081077576, 0.8622856140136719),
                                end: Alignment(0.9053288102149963, 0),
                                colors: [Colors.white, Colors.white]))),
                    InkWell(
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        //Todo eklenecek bu kod
                        // if (_debounce?.isActive ?? false) _debounce?.cancel();
                        // _debounce =
                        //     Timer(const Duration(milliseconds: 100), () {
                        //       _takePic();
                        //     });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (inputController.text.trim() != "") {
                          Messages msg = Messages();
                          msg.from = 0;
                          msg.text = inputController.text;
                          widget.messages.add(msg);
                          setState(() {
                            inputController.text = "";
                          });
                        } else {
                          Globals.toast(
                              false, "L??tfen ge??erli bir mesaj giriniz.");
                          inputController.text = '';
                          setState(() {
                            Globals().useTimer();
                          });
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.send,
                          size: 35,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaylanTextDeco extends InputDecoration {
  static txtDec(
    BuildContext context,
  ) {
    return InputDecoration(
      alignLabelWithHint: true,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            22,
          ),
        ),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      labelStyle: TextStyle(
          // height: 0.7,
          color: Color(0xff000000),
          fontWeight: FontWeight.w500,
          fontFamily: "Quicksand",
          fontStyle: FontStyle.normal,
          fontSize: 16),
      contentPadding: EdgeInsets.only(left: 10, top: 0),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            22,
          ),
        ),
        borderSide: BorderSide(
          color: Color(0xff9237e3),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(0)),
      ),
    );
  }
}
