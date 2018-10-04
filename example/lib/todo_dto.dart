library person_dto;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/serializers.dart';

part 'todo_dto.g.dart';

abstract class TodoDto implements Built<TodoDto, TodoDtoBuilder> {
  TodoDto._();

  factory TodoDto([updates(TodoDtoBuilder b)]) = _$TodoDto;

  @BuiltValueField(wireName: 'userId')
  int get userId;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'completed')
  bool get completed;

  String toJson() {
    return json.encode(serializers.serializeWith(TodoDto.serializer, this));
  }

  static TodoDto fromJson(String jsonString) {
    return serializers.deserializeWith(
        TodoDto.serializer, json.decode(jsonString));
  }

  static Serializer<TodoDto> get serializer => _$todoDtoSerializer;
}
