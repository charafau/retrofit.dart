// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _$SampleService extends SampleService {
  _$SampleService(Retrofit retrofit) {
    this.retrofit = retrofit;
  }

  Retrofit retrofit;

  @override
  Future<TodoDto> getTodo() async {
    final String url = retrofit.baseUrl + '/todos/1';

    final response = await retrofit.client.get(url);

    final fullType = FullType(TodoDto);

    TodoDto data = serializers.deserialize(json.decode(response.body),
        specifiedType: fullType);

    return data;
  }
}
