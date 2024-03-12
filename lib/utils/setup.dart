import 'package:flutter_week7_day3/services/db_service.dart';
import 'package:get_it/get_it.dart';

void setup() {
  
  GetIt.I.registerSingleton<DBSerivce>(DBSerivce());
}