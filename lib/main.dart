import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart' as toast;
import 'dart:convert';
import 'dart:async';
import './server/create.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Live Stream Test';
    final double itemHeight = 200;
    final double itemWidth = 200;

    var requestBody = {
      "hlsViewerCount":0,
      "webRTCViewerCount":0,
      "rtmpViewerCount":0,
      "mp4Enabled":0,
      "name":"Testing API",
      "type":"liveStream"
    };

    void showToast(String msg) {
      toast.Fluttertoast.showToast(
        msg: msg,
        toastLength: toast.Toast.LENGTH_LONG
      );
    }

    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child:  GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / itemHeight),
                children: List.generate(4, (index) {
                  return new Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                    ),
                    child: new Center(
                      child: new Text(
                        "Watch This $index",
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey
                        )
                      ),
                    )
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 170.0),
              child: GestureDetector(
                onTap: () => {
                  ApiService.createBroadCast(requestBody).then((response) => {
                    if(response == "success") {
                      showToast("The Broadcast has been created successfully!")
                    } else {
                      showToast("The Broadcast creating was failed!")
                    }
                  })
                },
                child: ClipOval(
                  child: Container(
                    color: Colors.deepPurple,
                    height: 120.0,
                    width: 120.0,
                    child: Center(child: Text("Click to Stream", style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}