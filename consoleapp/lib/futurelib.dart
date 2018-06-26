import 'dart:async';
import 'dart:io';
import 'dart:convert';

void testLibFuturecAsyc() async {
  print(
      "\n******-----testLibFuturecAsyc use Future.then()-------------------\n");

  Future result = costlyQuery();
  result
      .then((value) => expensiveWork(value))
      .then((_) => lengthyComputation())
      .then((_) => print('*****************Done!'))
      .catchError((exception) {
    /* Handle exception... */
  });

  print("\n******-----testLibFuturecAsyc use await... -------------------\n");

  try {
    final value = await costlyQuery();
    await expensiveWork(value);
    await lengthyComputation();
    print('*****************Done!');
  } catch (e) {
    // Handle exception...
  }

  print(
      "\n******-----testLibFuturecAsyc use Future.await to await for multi futures... -------------------\n");

  var allResult = await Future.wait([
    new Future(() {
      print('*****************async function 1');
      return 'async function 1';
    }),
    new Future(() {
      print('*****************async function 2');
      return 'async function 2';
    }),
    new Future(() {
      print('*****************async function 3');
      return 'async function 3';
    }),
  ]);
  print('Done with all the long steps! $allResult');
  print("\n******-----testLibFuturecAsyc use Stream... -------------------\n");

  const dirInput = '/home/tanger/Downloads';
  print('dirInput = $dirInput');
  if (await FileSystemEntity.isDirectory(dirInput)) {
    final startingDir = new Directory(dirInput);
    await for (var entity
        in startingDir.list(recursive: true, followLinks: true)) {
      if (entity is File) {
        print(
            '$dirInput/++++++++++++++++++ ${entity.path},${(await entity.length()).toStringAsFixed(0)}');
      }
    }
  } else {
    print('INPUT:$dirInput is NOT dir.');
  }

  print("\n******-----testLibFuturecAsyc readFileAwaitFor... -------------------\n");
  await readFileAwaitFor();
}

costlyQuery() async {
  const s = '*****************costlyQuery executed.';
  print(s);
  return s;
}

expensiveWork(v) async {
  String s = '*****************$v ok. and then expensiveWork executed.';
  print(s);
  return s;
}

lengthyComputation() async {
  const s = '*****************lengthyComputation executed.';
  print(s);
  return s;
}

Future readFileAwaitFor() async {
  Directory current = Directory.current;
  print('current Directory:$current');
  var config = new File(current.path + '/bin/config.txt');
  Stream<List<int>> inputStream = config.openRead();

  var lines = inputStream.transform(utf8.decoder).transform(new LineSplitter());
  try {
    await for (var line in lines) {
      print('Got ${line.length} characters from stream:$line');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
  }
}
