import 'dart:async';
import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:example/todo_dto.dart';
import 'package:example/serializers.dart';
import 'package:retrofit/src/retrofit.dart';
import 'package:retrofit/src/retrofit_annotations.dart';
import 'package:retrofit/src/retrofitted.dart';

part 'sample_service.g.dart';

abstract class SampleService implements Retrofitted {

  static SampleService create(Retrofit retrofit) {
   return _$SampleService(retrofit);
  }

  @Get("/todos/1")
  Future<TodoDto> getTodo();

}