import 'package:hive/hive.dart';
import 'keys.dart';


class Boxes {

  static Box<dynamic> settings() => Hive.box<dynamic>(Keys.settings);

}