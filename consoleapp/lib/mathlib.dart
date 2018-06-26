import 'dart:math';


void testLibMathAsyc() async {
  await _testLibMath();
} 
_testLibMath() async {
  print("\n******-----testLibMathAsyc -------------------\n");

  //Note: trigonometric functions use radians, not degrees!

  // Cosine
  print("cos(pi)=${cos(pi)}");
  // Sine
  var degrees = 30;
  var radians = degrees * (pi / 180);
  // radians is now 0.52359.
  var sinOf30degrees = sin(radians);

  print("sin(30*pi/180)=${sinOf30degrees.toStringAsFixed(2)}");
  // sin 30° = 0.5
  print("(sinOf30degrees - 0.5).abs()=${(sinOf30degrees - 0.5).abs()}");

  print("max(1, 1000) = ${max(1, 1000)}");
  print("max(1, -1000) = ${max(1, -1000)}");

  // See the Math library for additional constants.
  print("e=$e"); // 2.718281828459045
  print("pi=$pi"); // 3.141592653589793
  print("sqrt2=$sqrt2"); // 1.4142135623730951

  var random = new Random();
  var list = new List();
  for (var loop = 0; loop < 10; loop++) {
    list.add(random.nextDouble()); // Between 0.0 and 1.0: [0, 1)
  }
  print("random doubles: $list");
  list.clear();

  for (var loop = 0; loop < 10; loop++) {
    list.add(random.nextInt(10));
  }
  print("random ints: $list");
  list.clear();

  for (var loop = 0; loop < 10; loop++) {
    list.add(random.nextBool());
  }
  print("random bools: $list");
}
