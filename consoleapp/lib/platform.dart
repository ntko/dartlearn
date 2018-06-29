import 'dart:io';

void testPlatform() {
  print("\n******-----testPlatform -------------------\n");
  Map environmentVars = new Map.from(Platform.environment);
  print('environmentVars=$environmentVars');
  print('PWD = ${environmentVars["PWD"]}');
  print('LOGNAME = ${environmentVars["LOGNAME"]}');
  print('PATH = ${environmentVars["PATH"]}');

  print('Platform.isMacOS=${Platform.isMacOS}');
  print('Platform.numberOfProcessors=${Platform.numberOfProcessors}');
  print('Platform.script.path=${Platform.script.path}');
  print(
      'Currently run on:${Platform.operatingSystem},version:${Platform.operatingSystemVersion}');
  var path = Platform.script.resolve("quotes.txt").toFilePath();
  print('Platform.script.resolve("quotes.txt").toFilePath()=$path');
}
