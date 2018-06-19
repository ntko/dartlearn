
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