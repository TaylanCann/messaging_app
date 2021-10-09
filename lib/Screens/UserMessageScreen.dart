import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Messages {
  late String text;
  // If from == 0 MessageFrom me, from ==1 MessageFromU
  late int from;
}

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
  ScrollController _scrollController = new ScrollController();
  late Timer _debounce;

  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    for (int i = 0; i < rng.nextInt(50); i++) {
      Messages msg = Messages();
      var rng = new Random();
      msg.from = rng.nextInt(2);
      print(msg.from.toString());
      msg.text = widget.getRandomString(rng.nextInt(30));
      widget.messages.add(msg);
    }
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
                    itemBuilder: (context, i) {
                      return ListTile(
                          title: widget.messages[i].from != 0
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
                          onTap: () {
                            setState(() {
                              if (_debounce.isActive) _debounce.cancel();
                              _debounce =
                                  Timer(const Duration(milliseconds: 500), () {
                                _scrollController.animateTo(
                                    _scrollController.position.maxScrollExtent,
                                    duration: Duration(milliseconds: 700),
                                    curve: Curves.fastOutSlowIn);
                              });
                            });
                          },
                          // focusNode: focusNode,
                          // controller: inputController,
                          minLines: 1,
                          maxLines: 3,
                          decoration: TaylanTextDeco.txtDec(context),
                          // maxLines: 3,
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
                        // if (_debounce?.isActive ?? false) _debounce.cancel();
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
                        // inputController.text.trim() != ""
                        //     ? channel.sink.add(json.encode({
                        //   'msg': inputController.text,
                        //   'time': DateTime.now().toString(),
                        //   'token': await Token.readToken(),
                        //   'subject': widget.statu,
                        //   'sender': userId,
                        //   'roomId': roomId,
                        //   "admin": false,
                        //   'media': false
                        // }))
                        //     : Globals.toast(
                        //     false, "Lütfen geçerli bir mesaj giriniz.");
                        // inputController.text = '';
                        // setState(() {
                        //   if (_debounce?.isActive ?? false)
                        //     _debounce.cancel();
                        //   _debounce = Timer(
                        //       const Duration(milliseconds: 300), () {
                        //     _scrollController.animateTo(_scrollController.position.maxScrollExtent,
                        //         duration: Duration(milliseconds: 300),
                        //         curve: Curves.fastOutSlowIn);
                        //   });
                        // });
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
      labelText: 'Açıklama yazınız..',
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
