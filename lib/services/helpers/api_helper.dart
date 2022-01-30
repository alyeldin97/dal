import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projects_template/services/helpers/api_config.dart';

class APIHelper {
  static Future<http.Response> getRequest(APIConfigModel apiConfigModel,{String? customUrl}) async {
    var headers = {
      'Authorization': apiConfigModel.authorization,
      'Content-Type': apiConfigModel.contentType,
    };
    http.Response response = await http.get(
        Uri.parse(customUrl ??apiConfigModel.url),
        headers: headers);

    return response;
  }

 

  static Future<http.Response> postRequest(APIConfigModel apiConfigModel, body) async {
    var headers = {
      'Authorization': apiConfigModel.authorization,
      'Content-Type': apiConfigModel.contentType,
    };
    http.Response response =
        await http.post(Uri.parse(apiConfigModel.url),
            body: jsonEncode(body)
            //  jsonEncode(body)
            ,
            headers: headers);

    return response;
  }

}