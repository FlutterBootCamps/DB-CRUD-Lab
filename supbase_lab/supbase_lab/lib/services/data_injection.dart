
import 'package:get_it/get_it.dart';
import 'package:supbase_lab/services/database.dart';

class DataInjection{
  final locator = GetIt.instance;

  void setup(){
    locator.registerSingleton<DBServices>(DBServices());
  }
}