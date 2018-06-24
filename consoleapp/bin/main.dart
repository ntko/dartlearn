import 'package:consoleapp/consoleapp.dart' as consoleapp;

import 'package:consoleapp/libraryuse.dart' as libuse;
import 'package:consoleapp/libshow.dart' as libshow show sayHello;

//think: althought use lazy load,this import statement exists, will not allow us 'really' load
//packages on demand, perhaps reflection??
import 'package:consoleapp/deferdlib.dart' deferred as lazyload;
import 'package:consoleapp/datatype.dart' as dataTypetest;
import 'package:consoleapp/function.dart' as functiontest;
import 'package:consoleapp/exception.dart' as exceptiontest;
import 'package:consoleapp/class.dart' as classtest;
import 'package:consoleapp/others.dart' as othertest;

import 'package:consoleapp/corelib.dart' as corelibtest;
import 'package:consoleapp/futurelib.dart' as futurelibtest;

import 'package:consoleapp/todo.dart';

import "dart:async";

Future testLazyload() async {
  await lazyload.loadLibrary();
  lazyload.print_Deferred();
}

// This is where the app starts executing.
main(List<String> arguments) {
  //arguments...
  print("arguments=$arguments");

  //basic expression print
  print('Hello world: consoleapp.calculate():${consoleapp.calculate()}!');

  //library use...
  libuse.toString();
  libshow.sayHello();
  testLazyload();

  dataTypetest.testNumbers();
  dataTypetest.testStrings();
  dataTypetest.testLists();
  dataTypetest.testMaps();
  dataTypetest.testRunes();
  dataTypetest.testSymbols();

  functiontest.testOptionalPara(gifts: {'a': 'aValue', 'b': 'bValue'}, list: [3, 4, 5]);
  functiontest.testOptionalPara(list: [5, 4, 4]);
  functiontest.testAonymousFunction();
  functiontest.testClosures();

  exceptiontest.testException(true);
  exceptiontest.testException(false);

  classtest.testClass();
  classtest.testGetterAndSetter();
  classtest.testImplicitInterface();
  classtest.testNoSuchMethod();
  classtest.testCallableClass();
  classtest.testEnumsAndSwitchCase();

  
  othertest.testGenerics();

  //the following will output the latest, why? more await..
  othertest.testFutures();
  
  othertest.testGeneratorSync();
  othertest.testGeneratorAsync();

  corelibtest.testLibCoreAsyc();

  futurelibtest.testLibFuturecAsyc();

  print('\n------------End of Main().');
}

//Custom metadata
@Todo('seth', 'make this do something','2018-6-22')
testMetadata(){
  //You can retrieve metadata at runtime using reflection.
}