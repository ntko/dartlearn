import 'dart:async';

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
    new Future((){
      print('*****************async function 1');
      return 'async function 1';
    }),
    new Future((){
      print('*****************async function 2');
      return 'async function 2';
    }),
    new Future((){
      print('*****************async function 3');
      return 'async function 3';
    }),
  ]);
  print('Done with all the long steps! $allResult');
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
