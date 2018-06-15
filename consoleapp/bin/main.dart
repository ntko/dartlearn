import 'package:consoleapp/consoleapp.dart' as consoleapp;

import 'package:consoleapp/libraryuse.dart' as libuse;
import 'package:consoleapp/libshow.dart' as libshow show sayHello;

//think: althought use lazy load,this import statement exists, will not allow us 'really' load
//packages on demand, perhaps reflection??

import 'package:consoleapp/deferdlib.dart' deferred as lazyload;

import "dart:async";

// This is where the app starts executing.
main(List<String> arguments) {
  //arguments...
  print("arguments=$arguments");

  //basic expression print
  print('Hello world: consoleapp.calculate():${consoleapp.calculate()}!');

  //library use...
  libuse.toString();
  libshow.sayHello();

  testNumbers();

  testLazyload();

  testStrings();
  testLists();
  testMaps();
  testRunes();
  testSymbols();

  testOptionalPara(gifts: {'a': 'aValue', 'b': 'bValue'}, list: [3, 4, 5]);

  testOptionalPara(list: [5, 4, 4]);

  testAonymousFunction();

  testClosures();

  testException();

  testClass();

  testGetterAndSetter();

  testImplicitInterface();

  testNoSuchMethod();

  testEnumsAndSwitchCase();

  testGenerics();

  testFutures();

  testGeneratorSync();

  testGeneratorAsync();

  print('\n------------End of Main().');
}

// Define a function. and print variable
printInteger(int aNumber) {
  print(
      'function in main.dart, printInteger:The number is $aNumber.'); // Print to console.
}

printDouble(double dNumber) {
  print(
      'function in main.dart, printDouble:The number is ${dNumber.toStringAsFixed(4)}.'); // Print to console.
}

testNumbers() {
  //althought it's an int, if not initialized, it will == null,NOT 0
  int lineCount;
  assert(lineCount == null);
  print('lineCount = ${(lineCount??0)*2}.');

//Numbers ****************************
  var aNumber = 42; // Declare and initialize a variable.
  var dNumber = 3.1415926;
  //Call a function. basic variable print
  printInteger(aNumber);
  printDouble(dNumber);
}

Future testLazyload() async {
  await lazyload.loadLibrary();
  lazyload.print_Deferred();
}

testStrings() {
  print("\n******-----testStrings-------------------\n");
  var stringA = 'It\'s a good film.';
  var stringB = "It's a good film.";
  var stringC = 'It\'s a' + " good film.";
  var stringD = '''Test special string 
                literals with line-return
                ''';
  var stringE = r'This is\n a raw string...';

  print("${stringA}\n${stringB}\n${stringC}\n${stringD}\n${stringE}\n");
}

testLists() {
  print("\n******-----testLists-------------------\n");
  var list = <int>[1, 2, 3];
  //Compiled and execute ok. but the result is unespected as:list[2] = [1, 2, 3][2]
  print("list[2] = $list[2]");
  //Correct way:
  print("list[2] = ${list[2]}");
}

testMaps() {
  print("\n******-----testMaps-------------------\n");
  var testMap = <String, String>{"key1": "value1"};

  testMap["key2"] = "value2";
  testMap.putIfAbsent("key2", () => "newvalue2");
  testMap.putIfAbsent("key3", () => "newvalue3");
  print("testMap = $testMap");
}

testRunes() {
  print("\n******-----testRunes-------------------\n");
  var clapping = '\u{1f44f}';
  print(clapping);
  print(clapping.codeUnits);
  print(clapping.runes.toList());

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));

  print("\n******-----test String Reverse-------------------\n");
  var testSring1 = "Music \u{1d11e} for the win"; // Music 𝄞 for the win
  //reverse using split
  print(
      '"$testSring1" reverted to: "${testSring1.split('').reversed.join()}"'); // niw eht rof
  //reverse using runes
  print(
      '"$testSring1" reverted to: "${new String.fromCharCodes(testSring1.runes.toList().reversed)}"'); // niw eht rof 𝄞 cisuM

  //reverse string with accent character
  var testSring2 = 'Ame\u{301}lie'; // Amélie
  print(
      '"$testSring2" reverted to: "${new String.fromCharCodes(testSring2.runes.toList().reversed)}"'); // eiĺemA

  testSring2 = '联通测试中文反转.'; // Amélie
  print(
      '"$testSring2" reverted to: "${new String.fromCharCodes(testSring2.runes.toList().reversed)}"'); // eiĺemA
}

testSymbols() {
  print("\n******-----testSymbols-------------------\n");
  var list = [];
  print("list = $list");
  print("#list = ${(#list).hashCode}");
}

void testOptionalPara(
    {List<int> list = const [1, 2, 3],
    Map<String, String> gifts = const {
      'first': 'paper',
      'second': 'cotton',
      'third': 'leather'
    }}) {
  print("\n******-----testOptionalPara-------------------\n");
  print('list:  $list');
  print('gifts: $gifts');
}

void testAonymousFunction() {
  print("\n******-----testAonymousFunction-------------------\n");
  var list = ['apples', 'bananas', 'oranges'];
  list.forEach((item) => print('${list.indexOf(item)}: $item'));
}

/// Returns a function that adds [addBy] to the
/// function's argument.
Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

void testClosures() {
  print("\n******-----testClosures-------------------\n");
  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  print("add2(3) = ${add2(3)}");
  print("add4(3) = ${add4(3)}");
}

void testException() {
  print("\n******-----testException-------------------\n");
  try {
    var a = 12.0 / 0.0;
    print("a=$a\n");
    throw new FormatException('Expected at least 1 section');
  } on Exception catch (e) {
    print('Exception details:\n $e');
  } catch (e, s) {
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
  } finally {
    print('finally executed\n');
  }
}

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

class SomeBaseClass {
  @override
  String toString() {
    // TODO: implement toString
    String toString() => "this is a 'SomeBaseClass' instance.";
    return super.toString();
  }
}

class FooGeneric<T extends SomeBaseClass> {
  // Implementation goes here...
  String toString() => "Instance of 'FooGeneric<$T>'";
}

class Extender extends SomeBaseClass {
  @override
  String toString() => "this is a 'Extender' instance.";
}

void testGenerics() {
  print("\n******-----testGenerics-------------------\n");
  var someBaseClassFoo = new FooGeneric<SomeBaseClass>();
  var extenderFoo = new FooGeneric<Extender>();
  var foo = new FooGeneric(); //It’s also OK to specify no generic argument
  print("someBaseClassFoo:$someBaseClassFoo");
  print("extenderFoo:$extenderFoo");
  print("foo:$foo"); // Instance of 'Foo<SomeBaseClass>'
  //var errfoo = new FooGeneric<Object>(); //Specifying any non-SomeBaseClass type results in an error!!
  print(
      "extenderFoo is FooGeneric<Extender>: ${extenderFoo is FooGeneric<Extender>}");
  print(
      "extenderFoo is FooGeneric<SomeBaseClass>:${extenderFoo is FooGeneric<SomeBaseClass>}");
  print(
      "someBaseClassFoo is FooGeneric<Extender>: ${someBaseClassFoo is FooGeneric<Extender>}");
}

CheckVersion() async => '2.0.0';
GetVersion() async => '3.0.0';

void testFutures() async {
  print("\n******-----testFutures-------------------\n");

  var result0 = await CheckVersion();

  Function anonymousF = () async => '1.0.0';
  var result1 = await anonymousF();

  Function syncF = GetVersion;
  var result2 = await syncF();

  var result3 = await () async =>
      '4.0.0'; //NOTE::: Compare with the following code and execution result.

  var result4 = await (() async => '5.0.0')();

  var result5 = await new Future(() => '6.0.0');

  print(
      'In testFutures: result0 is ${result0},result0.type=${result0.runtimeType}');
  print(
      'In testFutures: result2 is ${result1},result1.type=${result1.runtimeType}');
  print(
      'In testFutures: result2 is ${result2},result2.type=${result2.runtimeType}');
  print(
      'In testFutures: result3 is ${result3},result3.type=${result3.runtimeType}');
  print(
      'In testFutures: result4 is ${result4},result4.type=${result4.runtimeType}');
  print(
      'In testFutures: result5 is ${result5},result5.type=${result5.runtimeType}');
}


Iterable naturalsTo(n) sync* {
  int k = 0;
  while (k < n) {
    yield k++;
  }
}

Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    print("naturalsDownFrom--yield $n");
    yield n;
    yield* naturalsDownFrom(n - 1); //yield* means yield for each
  }
}

Iterable<int> naturalsDownFromNew(n) sync* {
  if (n > 0) {
    print("naturalsDownFromNew--yield $n");
    yield n;
    for (int i in naturalsDownFromNew(n - 1)) {
      print("naturalsDownFromNew--for each i  yield $i");
      yield i;
    }
  }
}


void testGeneratorSync(){

  print("\n******-----testGeneratorSync-------------------\n");

  var iter0 = naturalsTo(4);
  print('inte0 = $iter0 ');
  
  var iter1 = naturalsDownFrom(4);
  print('inte1 = $iter1 ');

  var iter2 = naturalsDownFromNew(4);
  print('iter2 = $iter2 ');
}

Stream<int> asynchronousNaturalsTo(n) async* {
  int k = 0;
  while (k < n) {
    if (k == 6) {
      throw new Exception('Intentional exception');
    } else {
      yield k++;
    }    
  }
}


Stream get naturals async* {
  int k = 0; while (k<10) { yield await k++; }
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  try{
    await for (var value in stream) {
      sum += value;
    }
  }
  catch(e)
  {
    print('Exception captured. e= ${e.toString()}');
  }
  return sum;
}

Future<int> lastPositive(Stream<int> stream) async =>
    stream.lastWhere((x) => x >= 0);

void testGeneratorAsync() async{

  print("\n******-----testGeneratorAsync-------------------\n");

  var asycStream = asynchronousNaturalsTo(5);
  await for (int i in asycStream) { 
    print('event loop $i'); 
  }

  var asycStream1 = asynchronousNaturalsTo(101);

  var sum = await sumStream(asycStream1);
  print('\nsum=$sum'); // 55


  print('\n');
  var asycSream2 = naturals;
   await for (int ii in asycSream2) { 
    print('--yield await event loop $ii'); 
  } 
  print('\n');

  var asycSream3 = asynchronousNaturalsTo(6);
  var lastPos =await lastPositive(asycSream3);
  print('\lastPos=$lastPos'); 
}