import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:args/args.dart';

const lineNumberFlag = 'line-number';
const linePrintFlag = 'line-print';

void testfileop(List<String> arguments) async {
  print("\n******-----testfileop -------------------\n");

  /* 
  debug mode, stdin will now work for input.
  so just comment the following code.

  stdout.writeln('Type something');
  String input = stdin.readLineSync();
  stdout.writeln('You typed: $input');

//In this case, the user types in lines of text and the program copies them to stdout. 
//The user signals the end of input by typing <ctl-d>.
  stdin.pipe(stdout);
  // */
  final parser = new ArgParser()
    ..addFlag(lineNumberFlag, negatable: false, abbr: 'n')
    ..addFlag(linePrintFlag, negatable: false, abbr: 'p');

  ArgResults argResults;
  try {
    argResults = parser.parse(arguments);
  } on ArgParserException catch (e) {
    print('Exception details:\n $e');
    print('e.commands = ${e.commands}');
  } catch (e, s) {
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
  }

  List<String> paths = argResults.rest;
  print("paths=$paths");
  print("argResults[lineNumberFlag]=${argResults[lineNumberFlag]}");
  print("argResults[linePrintFlag]=${argResults[linePrintFlag]}");

  bool showLineNumbers = argResults[lineNumberFlag];

  print("\n******-----testfileop reading from file-------------------\n");
  Directory current = Directory.current;
  print('current Directory:$current');
  var configPath = current.path + '/bin/config.txt';
  var config = new File(configPath);

  int lineNumber = 1;

  Stream<List<int>> inputStream = config.openRead();

  var lines = inputStream.transform(utf8.decoder).transform(new LineSplitter());
  try {
    await for (var line in lines) {
      if (showLineNumbers) {
        stdout.write('--${lineNumber++} ');
      }
      stdout.writeln(line);
    }
  } catch (e) {
    _handleError(configPath);
    stderr.writeln(e);
  }

  print(
      "\n******-----testfileop write to file use writeAsString-------------------\n");
  var quotesFilePath = current.path + '/bin/quotes.txt';
  File quotesFile = new File(quotesFilePath);
  String stronger = 'That which does not kill us makes us stronger. -Nietzsche\n';
  String stronger2 =
      'That which does not kill us makes us stronger. -Nietzsche??\n';

  try {
    quotesFile.writeAsStringSync(stronger, mode: FileMode.append);
    await quotesFile.writeAsString(stronger2, mode: FileMode.append);
    print('Data written.');
  } catch (e) {
    print('Oops!');
  }

  print(
      "\n******-----testfileop write to file use IOSink-------------------\n");
  IOSink quotes = new File(quotesFilePath).openWrite(mode: FileMode.append);

  quotes.writeln('use IOSink-------------------');
  quotes.writeln('A woman is like a tea bag; ');
  quotes.writeln('you never know how strong it is until it\'s in hot water.');
  quotes.write(' -Eleanor Roosevelt');
  await quotes.close();
  print('Done!');
}

Future _handleError(String path) async {
  if (await FileSystemEntity.isDirectory(path)) {
    stderr.writeln('error: $path is a directory');
  } else {
    exitCode = 2;
  }
}
