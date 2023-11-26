import 'dart:math';

import 'package:vector_math/vector_math_64.dart';

class CoordinateConverter {
  static double toLatitude(int x, int y, int z) {
    double r = sqrt((x * x) + (y * y) + (z * z));
    print(90 - degrees(acos(y / r)));
    return 90 - degrees(acos(y / r));
    // double result = 90 - (acos(y / r) * 180 / pi);
    // print(result);
    // return result;
  }

  static double toLongitude(int x, int z) {
    print(degrees(atan(x / z)));
    return degrees(atan(x / z));
    // double result = ((270 + atan2(x, z)) * 180 / pi) % 360;
    // print(result);
    // return result;
  }
}
