import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import '../mixins/rootModel.dart';

class FirebaseJson {
  Future<RootModel> getData() async {
    Response response = await get('https://saicix.firebaseio.com/.json');
    RootModel model = RootModel.fromJson(json.decode(response.body));
    return model;
  }
}
