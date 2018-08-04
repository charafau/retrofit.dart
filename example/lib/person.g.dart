// GENERATED CODE - DO NOT MODIFY BY HAND

part of person;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

class _$Person extends Person {
  @override
  final String name;

  factory _$Person([void updates(PersonBuilder b)]) =>
      (new PersonBuilder()..update(updates)).build();

  _$Person._({this.name}) : super._() {
    if (name == null) throw new BuiltValueNullFieldError('Person', 'name');
  }

  @override
  Person rebuild(void updates(PersonBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonBuilder toBuilder() => new PersonBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Person) return false;
    return name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Person')..add('name', name))
        .toString();
  }
}

class PersonBuilder implements Builder<Person, PersonBuilder> {
  _$Person _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  PersonBuilder();

  PersonBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Person other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Person;
  }

  @override
  void update(void updates(PersonBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Person build() {
    final _$result = _$v ?? new _$Person._(name: name);
    replace(_$result);
    return _$result;
  }
}
