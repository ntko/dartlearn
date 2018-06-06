import 'package:consoleapp/consoleapp.dart' as consoleapp;

import 'package:consoleapp/libraryuse.dart' as libuse;
import 'package:consoleapp/libshow.dart' as libshow show sayHello;

//think: althought use lazy load,this import statement exists, will not allow us 'really' load
//packages on demand, perhaps reflection??

import 'package:consoleapp/deferdlib.dart' deferred as lazyload;

import "dart:async";

// Define a function. and print variable
printInteger(int aNumber) {
  print('function in main.dart, printInteger:The number is $aNumber.'); // Print to console.
}

printDouble(double dNumber) {
  print('function in main.dart, printDouble:The number is ${dNumber.toStringAsFixed(4)}.'); // Print to console.
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

  var stringA = 'It\'s a good film.';
  var stringB = "It's a good film.";
  var stringC = 'It\'s a' + " good film.";
  var stringD = '''Test special string 
                literals with line-return
                ''';
  var stringE = r'This is\n a raw string...';

  print("${stringA}\n${stringB}\n${stringC}\n${stringD}\n${stringE}\n");


  var list = [1, 2, 3];
  //list[2] = '2';

  print('End.');
}
