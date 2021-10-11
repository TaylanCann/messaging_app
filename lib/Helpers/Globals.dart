import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Globals {
  ScrollController scrollController = new ScrollController();

  static toast(stat, msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: stat ? Colors.green : Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showMyDialog(BuildContext context, String textWarning,
      String textBtnAns, Function() continueFunc,
      {Function()? exit, String? textBtnAns2}) {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(
                      17)),
                  gradient: LinearGradient(
                      begin: Alignment(0.9440176486968994, 0.04915884137153627),
                      end: Alignment(0.09232494235038757, 1),
                      colors: [
                        const Color(0xff9617ad),
                        const Color(0xff5f35bf),
                        const Color(0xff2d8fd9)
                      ])),
              height: textWarning.length >=200? 500:300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        10),
                    child: Center(
                      child: Text(textWarning,
                          softWrap: true,
                          style: TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Quicksand",
                              fontStyle: FontStyle.normal,
                              fontSize:
                                  18),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          continueFunc();
                        },
                        child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(
                                5,
                              ),
                              child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 5),
                                        child: Text(textBtnAns,
                                            style: TextStyle(
                                                color: const Color(0xffffffff),
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Quicksand",
                                                fontStyle: FontStyle.normal,
                                                fontSize:
                                                18),
                                            textAlign: TextAlign.left),
                                      ),
                                    ],
                                  ),
                                  width: 120,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(
                                          36)),
                                      color: const Color(0xffffffff).withOpacity(0.1))),
                            ),
                            width: 130,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                   36)),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0x66000000),
                                      offset: Offset(5, 5),
                                      blurRadius: 5,
                                      spreadRadius: 0)
                                ],
                                gradient: LinearGradient(
                                    begin:
                                    Alignment(0.9440176486968994, 0.04915884137153627),
                                    end: Alignment(0.09232494235038757, 1),
                                    colors: [
                                      const Color(0xffb842ce),
                                      const Color(0xff6d51c9),
                                      const Color(0xff5596e2)
                                    ]))),
                      ),
                      SizedBox(width: 10),
                      exit != null
                          ?InkWell(
                        onTap: () {
                          exit();
                        },
                        child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(
                                5,
                              ),
                              child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      textBtnAns2 != null ? Padding(
                                        padding: EdgeInsets.only(
                                            left: 5),
                                        child: Text(textBtnAns2,
                                            style: TextStyle(
                                                color: const Color(0xffffffff),
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "Quicksand",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 18),
                                            textAlign: TextAlign.left),
                                      ) : Container(),
                                    ],
                                  ),
                                  width: 120,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(
                                          36)),
                                      color: const Color(0xffffffff).withOpacity(0.1))),
                            ),
                            width: 130,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    36)),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0x66000000),
                                      offset: Offset(5, 5),
                                      blurRadius: 5,
                                      spreadRadius: 0)
                                ],
                                gradient: LinearGradient(
                                    begin:
                                    Alignment(0.9440176486968994, 0.04915884137153627),
                                    end: Alignment(0.09232494235038757, 1),
                                    colors: [
                                      const Color(0xffb842ce),
                                      const Color(0xff6d51c9),
                                      const Color(0xff5596e2)
                                    ]))),
                      )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  useTimer ()
  {
    Timer? _debounce;

    if (_debounce?.isActive ?? false)
     _debounce?.cancel();
   _debounce = Timer(
       const Duration(milliseconds: 300), () {
     scrollController.animateTo(
         scrollController.position.maxScrollExtent,
         duration: Duration(milliseconds: 300),
         curve: Curves.fastOutSlowIn);
   });
 }







}
