class Point {
  num x;
  num y;
  num area;

  Point() {
    x = 0;
    y = 0;
    area = 0;
    print('Point:Point()..');
  }
  Point.origin() : this(); //named constructor and Redirecting constructors

  //**`syntactic sugar`** for assigning a constructor argument to an instance variable.
  Point.init(num this.x, [num this.y = 4]) : area = x * y {
    //Initializer list
    print('Point:init()..');
  }

  Point.fromX_And_Area(num x, num area)
      : this.init(
            x, area ~/ x); //named constructor and Redirecting constructors

  Point.initializerTest(num ix, num iy)
      : x = ix,
        y = iy;

  String toString() => '(x:$x,y:$y,area:$area)';
}

class RectPoint extends Point {
  num w, h;

  RectPoint()
      : w = 0,
        h = 0 {
    print('RectPoint:RectPoint()..');
  }
  // Point does not have a default constructor;
  // we must call super.fromX_And_Area(...).
  RectPoint.fromX_And_Area(num x, num area) : super.fromX_And_Area(x, area) {
    print('in RectPoint fromX_And_Area');
    w = x * x;
    h = x * x * x;
  }

  RectPoint.initializerTest(num ix, num iy)
      : w = ix,
        h = iy;

  String toString() => '(x:$x,y:$y,area:$area,w:$w,h:$h)';
}

//Constant constructors
class ImmutablePoint {
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);
  final num x, y;
  const ImmutablePoint(this.x, this.y);
  String toString() => '(x:$x,y:$y,${origin.runtimeType})';
}

class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

void testClass() {
  print("\n******-----testClass-------------------\n");
  var p0 = new Point();
  var p1 = new Point.init(2, 4);
  var p2 = new Point.init(2);
  var p3 =
      Point.init(3); //!!! NEED --preview-dart-2 VM options, see launch.json
  var p4 = Point.fromX_And_Area(3, 15); //named constructor

  print('p0 = $p0\n');
  print('p1 = $p1\n');
  print('p2 = $p2\n');
  print('p3 = $p3\n');
  print('p4 = $p4\n');

  print("\n******-----testClass begin new RectPoint-------------------\n");

  var rp0 = new RectPoint();
  print('rp0 = $rp0\n');

  print(
      "\n******-----testClass begin new RectPoint.fromX_And_Area(3,18)-------------------\n");

  var rp1 = new RectPoint.fromX_And_Area(3, 18);
  print('rp1 = $rp1\n');

  if (identical(p1, p2)) {
    print("identical(p1, p2) = true;\n");
  } else {
    print("identical(p1, p2) = false;\n");
  }

  Type type = p1.runtimeType;
  print('The type.toString() of p1 is ${type.toString()}\n');
  print('The type.hashCode of p1 is ${type.hashCode}\n');
  print('The type.runtimeType of type is ${type.runtimeType}\n');

  print('ImmutablePoint.origin = ${ImmutablePoint.origin}\n');

  print(
      "\n******-----testClass begin test Factory constructor-------------------\n");

  var logger = new Logger('UI');
  logger.log('LOGGER: Button clicked\n');

  var logger2 = new Logger('UI');
  logger2.log('LOGGER2: Button clicked 2\n');

  var logger3 = new Logger('LOGIC');
  logger3.log('LOGGER3: Button clicked 3\n');

  if (identical(logger, logger2)) {
    print("identical(logger, logger2) = true;\n");
  } else {
    print("identical(logger, logger2) = false;\n");
  }

  if (identical(logger, logger3)) {
    print("identical(logger, logger3) = true;\n");
  } else {
    print("identical(logger, logger3) = false;\n");
  }
}

class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
  String toString() =>
      '(left:$left,top:$top,width:$width,height:$height,right:$right,bottom:$bottom)';
}

void testGetterAndSetter() {
  print("\n******-----testGetterAndSetter-------------------\n");
  var rect = new Rectangle(3, 4, 20, 15);
  print('rect = $rect\n');

  print("\n Now test operator ++ for getter-------------------\n");
  rect.right++;
  print('rect = $rect after rect.right++\n');

  rect.left++;
  print('rect = $rect after rect.left++\n');

  rect.bottom++;
  print('rect = $rect after rect.bottom++\n');
}

class Person {
  // In the interface, but visible only in this library.
  final _name;

  // Not in the interface, since this is a constructor.
  Person(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Impostor implements Person {
  get _name => 'tanger';

  var _private = 'dd';

  String greet(String who) =>
      'Hi $who. Do you know who I am? may be i\'m $_name';
}

String greetBob(Person person) => person.greet('Bob');

void testImplicitInterface() {
  print("\n******-----testImplicitInterface-------------------\n");
  var p = Person('Kathy');
  print(greetBob(p));
  var ip = Impostor();
  print(greetBob(ip));
  print("ip._name = ${ip._name},ip._private=${ip._private}");
}

class Foo {
  num foo(x) => 1.2;
}

class MockFoo implements Foo {
  @override
  noSuchMethod(Invocation i) {
    if (i.memberName == #foo) {
      if (i.isMethod &&
          i.positionalArguments.length == 1 &&
          i.namedArguments.isEmpty) {
        // ... implement mock behavior for `foo` here.
        print(
            "\n MockFoo:noSuchMethod:${i.memberName} invoked with argu ${i.positionalArguments[0]}\n");
        return 1.5;
      } else {
        return super.noSuchMethod(i);
      }
    } else {
      return super.noSuchMethod(i);
    }
  }
}

void testNoSuchMethod() {
  print("\n******-----testNoSuchMethod-------------------\n");
  var mf = MockFoo();
  var result = mf.foo('Ok,the foo is mocked!');
  print("result = $result");
}

class CallableClass {
  call(String a, String b, String c) => '$a $b $c!';
}

void testCallableClass() {
  print("\n******-----testCallableClass-------------------\n");
  var callable = new CallableClass();
  var out = callable("Hi","there,","gang");
  print('implicit call callable.call=>: $out');
}

enum Color { red, green, blue, pink, yellow }

void testEnumsAndSwitchCase() {
  print("\n******-----testEnumsAndSwitchCase-------------------\n");
  Color clrBlue = Color.blue;
  print("clrBlue.index = ${clrBlue.index}");
  List<Color> allColors = Color.values;
  print("allColors = ${allColors}");

  switch (clrBlue) {
    case Color.red:
      print('Red as roses!');
      break;
    case Color.green:
    case Color.pink:
      print('Green as grass! or pink as flower.');
      continue fallthrough; //test fall through

    fallthrough:
    //print('fallthrough.....'); //NOTE: NOT ALLOWED!
    default: // Without this, you see a WARNING.
      print("clrBlue = ${clrBlue}"); // 'Color.blue'
  }
}
