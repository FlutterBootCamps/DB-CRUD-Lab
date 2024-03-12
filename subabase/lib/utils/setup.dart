import 'package:get_it/get_it.dart';
import 'package:subabase/data/data_service.dart';

class DataClass {
  final locator = GetIt.I;

  void setup() {
    locator.registerSingleton<DBService>(DBService());
  }
}
