import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notes/EncryptedDatabase/EncryptedDatabase.dart';
import 'package:notes/Models/note.dart';

String apiUrl(String endPoint) {
  return 'http://192.168.1.67:3000/$endPoint';
}

class ApiResponse {
  int statusCode;
  dynamic jsonData;
  String message;
  bool error;
  ApiResponse(
    this.statusCode, {
    this.jsonData,
    this.message = "OK",
    this.error = false,
  });

  void setStatusCode(int code) => statusCode = code;
  void setMessage(String msg) => message = msg;
  void setJsonData(dynamic data) => jsonData = data;
  void seterror(bool data) => error = data;
}

class BasicReturnType {
  bool status = false;
  String message = "";
  var data = {};
}

Future<ApiResponse> doApi(
  String endPoint,
  Map<String, String> data,
  String reqType,
  String? bearerToken,
) async {
  final url = Uri.parse(apiUrl(endPoint));
  final response = ApiResponse(200);

  try {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    if (bearerToken != null && bearerToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $bearerToken';
    }
    var request = http.Request(reqType, url);
    request.bodyFields = data;
    request.headers.addAll(headers);

    http.StreamedResponse resp = await request.send();

    final bodyString = await resp.stream.bytesToString();
    try {
      final jsonData = jsonDecode(bodyString);
      response.setJsonData(jsonData);
    } catch (e) {
      response.setMessage("Server Error: $e");
    }
  } catch (e) {
    response.setStatusCode(500);
    response.setMessage("Internal Error: $e");
  }

  return response;
}

Future<BasicReturnType> register(String email, String password) async {
  final returnData = BasicReturnType();
  final data = await doApi(
    "register",
    {"email": email, "password": password},
    "POST",
    null,
  );
  final jsondata = data.jsonData;
  if (data.jsonData["error"] == false) {
    returnData.message = data.jsonData["message"];
    returnData.status = !data.jsonData["error"];
  } else {
    returnData.message = data.jsonData["message"];
  }
  return returnData;
}

Future<BasicReturnType> login(String email, String password) async {
  final returnData = BasicReturnType();
  final data = await doApi(
    "login",
    {"email": email, "password": password},
    "POST",
    null,
  );
  final jsondata = data.jsonData;
  if (data.jsonData["error"] == false) {
    returnData.message = data.jsonData["message"];
    returnData.status = !data.jsonData["error"];
    returnData.data = data.jsonData["data"];
  } else {
    returnData.message = data.jsonData["message"];
  }
  return returnData;
}

Future<BasicReturnType> getNotes() async {
  final returnData = BasicReturnType();
  final data = await doApi(
    "notes",
    {},
    "GET",
    EncryptedDatabase.instance.read("token"),
  );
  final jsondata = data.jsonData;
  if (data.jsonData["error"] == false) {
    returnData.message = data.jsonData["message"];
    returnData.status = !data.jsonData["error"];
    returnData.data = data.jsonData["data"];
  } else {
    returnData.message = data.jsonData["message"];
  }
  return returnData;
}

Future<BasicReturnType> addNote(Note note) async {
  final returnData = BasicReturnType();
  final data = await doApi(
    "notes",
    {"title": note.title, "body": note.body},
    "POST",
    EncryptedDatabase.instance.read("token"),
  );
  if (data.jsonData["error"] == false) {
    returnData.message = data.jsonData["message"];
    returnData.status = !data.jsonData["error"];
  } else {
    returnData.message = data.jsonData["message"];
  }
  return returnData;
}

Future<BasicReturnType> deleteNote(Note note) async {
  final returnData = BasicReturnType();
  final id = note.id;
  final data = await doApi(
    "notes/$id",
    {},
    "DELETE",
    EncryptedDatabase.instance.read("token"),
  );
  if (data.jsonData["error"] == false) {
    returnData.message = data.jsonData["message"];
    returnData.status = !data.jsonData["error"];
  } else {
    returnData.message = data.jsonData["message"];
  }
  return returnData;
}

Future<BasicReturnType> updateNote(Note note) async {
  final returnData = BasicReturnType();
  final id = note.id;
  final data = await doApi(
    "notes/$id",
    {"title": note.title, "body": note.body},
    "PUT",
    EncryptedDatabase.instance.read("token"),
  );
  if (data.jsonData["error"] == false) {
    returnData.message = data.jsonData["message"];
    returnData.status = !data.jsonData["error"];
  } else {
    returnData.message = data.jsonData["message"];
  }
  return returnData;
}
