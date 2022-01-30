import 'dart:convert';

import 'package:projects_template/services/errors/exceptions.dart';
import 'package:projects_template/services/helpers/api_config.dart';
import 'package:projects_template/services/helpers/api_helper.dart';
import 'package:projects_template/services/remote_datasources/temp/temp.dart';
import 'package:http/http.dart' as http;

class InsertNameRemoteDataSourceImpl implements InsertNameRemoteDataSource{
  @override
  Future getSomeData()async {
    //^ instantiate models that will be returned LISTS OR SINGLE VALUES
    //List<CategoryModel> categories = [];
    

    http.Response response;

    response = await APIHelper.getRequest(APIConfig.woocommercelistAllProducts);

    //^ get body of api call list or single value
    List body = jsonDecode(response.body) as List;

    //^ if list loop and create model for each value
    // body.forEach((category) {
    //   categories.add(CategoryModel.fromJson(category));
    // });
    
    if (response.statusCode == 201 || response.statusCode == 200) {

      //^ return model or list of models
      //return categories;
      //return ModelName.fromJson(response.body);
    } else {
      //^ throw propper failures
      throw ServerException();
    }
  }

}