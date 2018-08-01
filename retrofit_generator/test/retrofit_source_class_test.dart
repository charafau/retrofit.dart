import 'package:retrofit_generator/src/retrofit_source_class.dart';
import 'package:test/test.dart';

main() {
  final String sampleClass = '''
  abstract class SampleService implements Retrofitted {

  @Get("/person/1")
  Person getPerson();

}
  ''';


  test('should render retrofit class', () {

//    RetrofitSourceClass();

  });

}
