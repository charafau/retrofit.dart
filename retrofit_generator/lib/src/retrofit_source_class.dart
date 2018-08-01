import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:code_builder/code_builder.dart';
import 'dart:convert';

class RetrofitSourceClass {
  final ClassElement element;

  RetrofitSourceClass(this.element);

  static bool needsBuiltValue(ClassElement element) {
    return (element.allSupertypes.any((type) => type.name == 'Retrofitted'));
  }

  String generateCode() {
    final _dartfmt = new DartFormatter();

    Class generatedClass = new Class((b) => b
      ..name = '_\$' + element.name
      ..extend = new Reference(element.name)
      ..methods = BuiltList<Method>(
              element.methods.map((MethodElement m) => _buildMethod(m)))
          .toBuilder());

    String classString = generatedClass.accept(new DartEmitter()).toString();

    String header = """
      //import 'dart:convert';
    """;

    String output = _dartfmt.format(header + classString);

    return output;
  }

  Method _buildMethod(MethodElement m) {
    return new Method((b) => b
      ..name = m.name
      ..body = Code('return 5;')
      ..returns = new Reference('int')
      ..annotations = _createOverrideBuilder()
    );
  }

  ListBuilder<Expression> _createOverrideBuilder() => BuiltList<Expression>([new CodeExpression(new Code('override'))]).toBuilder();
}
