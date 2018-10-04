// GENERATED CODE - DO NOT MODIFY BY HAND

part of person_dto;

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

Serializer<TodoDto> _$todoDtoSerializer = new _$TodoDtoSerializer();

class _$TodoDtoSerializer implements StructuredSerializer<TodoDto> {
  @override
  final Iterable<Type> types = const [TodoDto, _$TodoDto];
  @override
  final String wireName = 'TodoDto';

  @override
  Iterable serialize(Serializers serializers, TodoDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'completed',
      serializers.serialize(object.completed,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  TodoDto deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TodoDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'completed':
          result.completed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$TodoDto extends TodoDto {
  @override
  final int userId;
  @override
  final int id;
  @override
  final String title;
  @override
  final bool completed;

  factory _$TodoDto([void updates(TodoDtoBuilder b)]) =>
      (new TodoDtoBuilder()..update(updates)).build();

  _$TodoDto._({this.userId, this.id, this.title, this.completed}) : super._() {
    if (userId == null) throw new BuiltValueNullFieldError('TodoDto', 'userId');
    if (id == null) throw new BuiltValueNullFieldError('TodoDto', 'id');
    if (title == null) throw new BuiltValueNullFieldError('TodoDto', 'title');
    if (completed == null)
      throw new BuiltValueNullFieldError('TodoDto', 'completed');
  }

  @override
  TodoDto rebuild(void updates(TodoDtoBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TodoDtoBuilder toBuilder() => new TodoDtoBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TodoDto) return false;
    return userId == other.userId &&
        id == other.id &&
        title == other.title &&
        completed == other.completed;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, userId.hashCode), id.hashCode), title.hashCode),
        completed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TodoDto')
          ..add('userId', userId)
          ..add('id', id)
          ..add('title', title)
          ..add('completed', completed))
        .toString();
  }
}

class TodoDtoBuilder implements Builder<TodoDto, TodoDtoBuilder> {
  _$TodoDto _$v;

  int _userId;
  int get userId => _$this._userId;
  set userId(int userId) => _$this._userId = userId;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  bool _completed;
  bool get completed => _$this._completed;
  set completed(bool completed) => _$this._completed = completed;

  TodoDtoBuilder();

  TodoDtoBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _id = _$v.id;
      _title = _$v.title;
      _completed = _$v.completed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TodoDto other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$TodoDto;
  }

  @override
  void update(void updates(TodoDtoBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TodoDto build() {
    final _$result = _$v ??
        new _$TodoDto._(
            userId: userId, id: id, title: title, completed: completed);
    replace(_$result);
    return _$result;
  }
}
