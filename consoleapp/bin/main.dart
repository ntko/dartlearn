import 'package:consoleapp/consoleapp.dart' as consoleapp;

import 'package:consoleapp/libraryuse.dart' as libuse;
import 'package:consoleapp/libshow.dart' as libshow show sayHello;

//think: althought use lazy load,this import statement exists, will not allow us 'really' load
//packages on demand, perhaps reflection??

import 'package:consoleapp/deferdlib.dart' deferred as lazyload;

import "dart:async";

// Define a function. and print variable
printInteger(int aNumber) {
  print(
      'function in main.dart, printInteger:The number is $aNumber.'); // Print to console.
}

printDouble(double dNumber) {
  print(
      'function in main.dart, printDouble:The number is ${dNumber.toStringAsFixed(4)}.'); // Print to console.
}

Future lazyloadTest() async {
  await lazyload.loadLibrary();
  lazyload.print_Deferred();
}

// This is where the app starts executing.
main(List<String> arguments) {
  //basic expression print
  print('Hello world: consoleapp.calculate():${consoleapp.calculate()}!');

  //library use...
  libuse.toString();
  libshow.sayHello();

  lazyloadTest();

//althought it's an int, if not initialized, it will == null,NOT 0
  int lineCount;
  assert(lineCount == null);
  print('lineCount = ${(lineCount??0)*2}.');

//Numbers ****************************

  var aNumber = 42; // Declare and initialize a variable.
  var dNumber = 3.1415926;
  //Call a function.basic variable print
  printInteger(aNumber);
  printDouble(dNumber);

  testStrings();
  testLists();
  testMaps();
  testRunes();
  testSymbols();

  testOptionalPara(
   gifts: {'a':'aValue','b':'bValue'},
  list: [3,4,5]) ;

  testOptionalPara(list: [5,4,4]);

  print('End.');
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
