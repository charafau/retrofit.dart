import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:retrofit_generator/src/retrofit_source_class.dart';
import 'package:source_gen/source_gen.dart';

/**
 * THIS SCANS ALL FILES IN PROJECT AND CHECKS IF THIS IS YOUR RetrofitRestService
 * AND RUNS GENERATOR
 */
class RetrofitGenerator extends Generator {
  const RetrofitGenerator();

  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    final result = new StringBuffer();

    for (final element in library.allElements) {
      //check if our current file contains RetrofitRestService
      if (element is ClassElement &&
          RetrofitSourceClass.needsBuiltValue(element)) {
        try {
          //generate code here
          result.writeln(RetrofitSourceClass(element).generateCode());
        } catch (e, st) {
          result.writeln(_error(e));
          log.severe('Error in RetrofitGenerator for $element.', e, st);
        }
      }
    }

    if (result.isNotEmpty) {
      return '$result';
    } else {
      return null;
    }
  }
}

String _error(Object error) {
  final lines = '$error'.split('\n');
  final indented = lines.skip(1).map((l) => '//        $l'.trim()).join('\n');
  return '// Error: ${lines.first}\n$indented';
}
