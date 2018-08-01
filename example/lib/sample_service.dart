import 'package:example/person.dart';
import 'package:retrofit/src/retrofitted.dart';
import 'package:retrofit/src/retrofit_annotations.dart';

part 'sample_service.g.dart';

abstract class SampleService implements Retrofitted {

  @Get("/person/1")
  int getPerson();

}
