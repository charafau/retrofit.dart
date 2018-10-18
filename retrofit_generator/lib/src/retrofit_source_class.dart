import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:code_builder/code_builder.dart';
import 'dart:convert';
import 'package:retrofit/src/retrofit_annotations.dart';
import 'package:source_gen/source_gen.dart';

class RetrofitSourceClass {
  final ClassElement element;

  RetrofitSourceClass(this.element);

  static bool needsBuiltValue(ClassElement element) {
    return (element.allSupertypes.any((type) => type.name == 'RetrofitRestService'));
  }

  String generateCode() {
    final _dartfmt = new DartFormatter();

    Class generatedClass = new Class((b) => b
      ..name = '_\$' + element.name
      ..fields = ListBuilder([
        Field((b) => b
          ..name = 'retrofit'
          ..type = Reference('Retrofit'))
      ])
      ..constructors = ListBuilder([
        new Constructor((b) => b
          ..body = Code('this.retrofit = retrofit;')
          ..requiredParameters = ListBuilder([
            Parameter((b) => b
              ..name = 'retrofit'
              ..type = Reference('Retrofit'))
          ]))
      ])
      ..extend = new Reference(element.name)
      ..methods = BuiltList<Method>(element.methods
          .where((MethodElement m) => !m.isStatic)
          .map((MethodElement m) => _buildMethod(m))).toBuilder());

    String classString = generatedClass.accept(new DartEmitter()).toString();

    String header = """
    """;

    String output = _dartfmt.format(header + classString);

    return output;
  }

  Method _buildMethod(MethodElement m) {
    String code = _createMethodBody(m);
    return new Method((b) {
      return b
        ..name = m.name
        ..modifier = MethodModifier.async
        ..body = Code(code)
        ..returns = new Reference('${m.returnType.displayName}')
        ..annotations = _createOverrideBuilder();
    });
  }

  String _createMethodBody(MethodElement m) {
    String code = '';
    if (m.metadata.length > 0) {
      m.metadata.forEach((ElementAnnotation element) {
        if (element.element.enclosingElement.name == "Get") {
          final DartObject annot = TypeChecker.fromRuntime(Get)
              .firstAnnotationOf(m, throwOnUnresolved: false);
          ConstantReader reader = ConstantReader(annot);
          DartType retType = m.returnType;
          String type = retType.toString();
          type = type.substring(type.indexOf('<') + 1, type.lastIndexOf('>'));
          var local = '''
             final String url = retrofit.baseUrl + '${reader.read("url").stringValue}';
             
             final response = await retrofit.client.get(url);
             
             final fullType = FullType($type);
             
             $type data = serializers.deserialize(
                json.decode(response.body),
                specifiedType: fullType);
                
             return data;
             
            ''';
          code = local;
        }
      });
    }
    return code;
  }

  ListBuilder<Expression> _createOverrideBuilder() =>
      BuiltList<Expression>([new CodeExpression(new Code('override'))])
          .toBuilder();
}
