import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart' as toast;
import 'dart:convert';
import 'dart:async';


class URLS {
  static const String baseURL = 'http://161.35.32.10:5080/LiveApp/rest/v2/broadcasts';
}

class ApiService {
  static Future<String> createBroadCast(requestBody) async {
    final response = await http.post('${URLS.baseURL}/create',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: json.encode(requestBody)
    );
    if(response.statusCode == 200) {
      print("Success!");
      print(response.body);
      return "success";
    } else {
      print("failed!");
      print(response.body);
      return "fail";
    }
  }
}