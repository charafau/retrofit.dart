import 'dart:async';

import 'package:example/sample_service.dart';
import 'package:example/todo_dto.dart';
import 'package:http/http.dart' as http;
import 'package:retrofit/src/retrofit.dart';

main(List<String> arguments) {

  http.Client client = http.Client();
  Retrofit retrofit = Retrofit(client, 'https://jsonplaceholder.typicode.com');

  var sampleService = SampleService.create(retrofit);

  invokeHttpCall(sampleService);
}

Future<void> invokeHttpCall(SampleService sampleService) async {
  print('Fetching...');
  TodoDto todo = await sampleService.getTodo();

  print('Fetched data is: ${todo.toString()}');
}
