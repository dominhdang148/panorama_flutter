import 'dart:math';

class CoordinateConverter {
  static double toLatitude(double z, double imageWidth) {
    double r = imageWidth / (2 * pi);
    return asin(z / r);
  }

  static double toLongitude(double x, double y) {
    return atan2(y, x);
  }
}
