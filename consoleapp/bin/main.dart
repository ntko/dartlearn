import 'package:consoleapp/consoleapp.dart' as consoleapp;
import 'package:consoleapp/libraryuse.dart' hide printall2;
import 'package:consoleapp/libshow.dart' show printall3;

//think: althought use lazy load,this import statement exists, will not allow us 'really' load
//packages on demand, perhaps reflection??

import 'package:consoleapp/deferdlib.dart' deferred as lazyload;

import "dart:async";

// Define a function.
printInteger(int aNumber) {
  print('function in main.dart, printInteger:The number is $aNumber.'); // Print to console.
}

Future lazyloadTest() async {
  await lazyload.loadLibrary();
  lazyload.printallDefer();
} 


// This is where the app starts executing.
main(List<String> arguments) {
  print('Hello world: consoleapp.calculate():${consoleapp.calculate()}!');
  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.

  printall1();
  printall3();

  lazyloadTest();
  //lazyload.printallDefer();

  int lineCount;
  assert(lineCount == null); 
  print('End.');
}
