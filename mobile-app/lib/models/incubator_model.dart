import 'package:uuid/uuid.dart';

import 'baby_model.dart';

class Incubator {
  final Uuid id;
  final List<BabyInfo> babies;
  Incubator({required this.babies, required this.id});
}
