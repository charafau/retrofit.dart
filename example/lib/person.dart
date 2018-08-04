library person;

import 'package:built_value/built_value.dart';

part 'person.g.dart';

abstract class Person implements Built<Person, PersonBuilder> {
  Person._();

  String get name;

  factory Person([updates(PersonBuilder b)]) = _$Person;
}
