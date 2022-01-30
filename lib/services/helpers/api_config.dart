import 'package:flutter/material.dart';
import 'package:projects_template/configs/constants/api_urls.dart';


class APIConfig {
  //^ Add inctances of the apiconfigmodel below with each api request example
  //^ woocommerce , digits ...etc get the basic url from config api urls then add /products /users ...etc

  static final woocommercelistAllProducts = APIConfigModel(
      contentType: 'Content-Header',
      authorization: 'Basic',
      url: APIUrls.woocommerce + 'products');
}





class APIConfigModel {
  String url;
  String authorization;
  String contentType;
  APIConfigModel(
      {required this.contentType,
      required this.authorization,
      required this.url});
}
