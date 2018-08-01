import 'package:build/build.dart';
import 'package:retrofit_generator/retrofit_generator.dart';

import 'package:source_gen/source_gen.dart';

Builder retrofitFactory(BuilderOptions _) =>
    new SharedPartBuilder([new RetrofitGenerator()], 'retrofit');
