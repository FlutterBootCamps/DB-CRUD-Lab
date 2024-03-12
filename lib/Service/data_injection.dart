import 'package:get_it/get_it.dart';
import 'package:ramadan2/api/api.dart';

class Datainjection{
  final locator = GetIt.instance;
  //set up 
  void setup(){
    locator.registerSingleton<DBService>(DBService());
  }
  
}