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

  print('End.');
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
  print("\n testStrings-------------------\n");
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
  print("\n testLists-------------------\n");
  var list = [1, 2, 3];
  //Compiled and execute ok. but the result is unespected as:list[2] = [1, 2, 3][2]
  print("list[2] = $list[2]");
  //Correct way:
  print("list[2] = ${list[2]}");
}

testMaps() {
  print("\n testMaps-------------------\n");
  var testMap = {"key1": "value1"};

  testMap["key2"] = "value2";
  testMap.putIfAbsent("key2", () => "newvalue2");
  testMap.putIfAbsent("key3", () => "newvalue3");
  print("testMap = $testMap");
}

testRunes() {
  print("\n testRunes-------------------\n");
  var clapping = '\u{1f44f}';
  print(clapping);
  print(clapping.codeUnits);
  print(clapping.runes.toList());

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));

  print("\n test String Reverse-------------------\n");
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
  print("\n testSymbols-------------------\n");
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
  print("\n testOptionalPara-------------------\n");
  print('list:  $list');
  print('gifts: $gifts');
}

void testAonymousFunction() {
  print("\n testAonymousFunction-------------------\n");
  var list = ['apples', 'bananas', 'oranges'];
  list.forEach((item) => print('${list.indexOf(item)}: $item'));
}

/// Returns a function that adds [addBy] to the
/// function's argument.
Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

void testClosures() {
  print("\n testClosures-------------------\n");
  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  print("add2(3) = ${add2(3)}");
  print("add4(3) = ${add4(3)}");
}

void testException() {
  print("\n testException-------------------\n");
  try {
    var a = 12/0;
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

class Point{
  num x;
  num y;
  Point(num this.x,[num this.y=4]);
  String toString()=>'(x:$x,y:$y)';
}

void testClass(){
  print("\n testClass-------------------\n");
  var p1 = new Point(2,4);
  var p2 = new Point(2);
  var p3 = Point(3);  //!!! NEED --preview-dart-2 VM options, see launch.json

  if(identical(p1, p2)){
    print("identical(p1, p2) = true;\n");
  }else{
    print("identical(p1, p2) = false;\n");
  }
  Type type = p1.runtimeType;
  print('The type.toString() of p1 is ${type.toString()}\n');
  print('The type.hashCode of p1 is ${type.hashCode}\n');
  print('The type.runtimeType of type is ${type.runtimeType}\n');
  print('p3 = $p3\n');
}