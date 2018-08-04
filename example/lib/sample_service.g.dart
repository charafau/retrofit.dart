// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

//import 'dart:convert';
class _$SampleService extends SampleService {
  @override
  Future<Person> getPerson() async {
    final String url = 'http://0.0.0.0:8080/api/people/1';

    final response = await http.get(url);

    final listType = FullType(Person);

    Person person = serializers.deserialize(json.decode(response.body),
        specifiedType: listType);

    return person;
  }
}
