import "dart:async";

class SomeBaseClass {
  @override
  String toString() {
    // TODO: implement toString
    String toString() => "this is a 'SomeBaseClass' instance.";
    return super.toString();
  }
}

class FooGeneric<T extends SomeBaseClass> {
  // Implementation goes here...
  String toString() => "Instance of 'FooGeneric<$T>'";
}

class Extender extends SomeBaseClass {
  @override
  String toString() => "this is a 'Extender' instance.";
}

void testGenerics() {
  print("\n******-----testGenerics-------------------\n");
  var someBaseClassFoo = new FooGeneric<SomeBaseClass>();
  var extenderFoo = new FooGeneric<Extender>();
  var foo = new FooGeneric(); //It’s also OK to specify no generic argument
  print("someBaseClassFoo:$someBaseClassFoo");
  print("extenderFoo:$extenderFoo");
  print("foo:$foo"); // Instance of 'Foo<SomeBaseClass>'
  //var errfoo = new FooGeneric<Object>(); //Specifying any non-SomeBaseClass type results in an error!!
  print(
      "extenderFoo is FooGeneric<Extender>: ${extenderFoo is FooGeneric<Extender>}");
  print(
      "extenderFoo is FooGeneric<SomeBaseClass>:${extenderFoo is FooGeneric<SomeBaseClass>}");
  print(
      "someBaseClassFoo is FooGeneric<Extender>: ${someBaseClassFoo is FooGeneric<Extender>}");
}

CheckVersion() async => '2.0.0';
GetVersion() async => '3.0.0';

void testFutures() async {
  print("\n******-----testFutures-------------------\n");

  var result0 = await CheckVersion();

  Function anonymousF = () async => '1.0.0';
  var result1 = await anonymousF();

  Function syncF = GetVersion;
  var result2 = await syncF();

  var result3 = await () async =>
      '4.0.0'; //NOTE::: Compare with the following code and execution result.

  var result4 = await (() async => '5.0.0')();

  var result5 = await new Future(() => '6.0.0');

  print(
      'In testFutures: result0 is ${result0},result0.type=${result0.runtimeType}');
  print(
      'In testFutures: result2 is ${result1},result1.type=${result1.runtimeType}');
  print(
      'In testFutures: result2 is ${result2},result2.type=${result2.runtimeType}');
  print(
      'In testFutures: result3 is ${result3},result3.type=${result3.runtimeType}');
  print(
      'In testFutures: result4 is ${result4},result4.type=${result4.runtimeType}');
  print(
      'In testFutures: result5 is ${result5},result5.type=${result5.runtimeType}');
}


Iterable naturalsTo(n) sync* {
  int k = 0;
  while (k < n) {
    yield k++;
  }
}

Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    print("naturalsDownFrom--yield $n");
    yield n;
    yield* naturalsDownFrom(n - 1); //yield* means yield for each
  }
}

Iterable<int> naturalsDownFromNew(n) sync* {
  if (n > 0) {
    print("naturalsDownFromNew--yield $n");
    yield n;
    for (int i in naturalsDownFromNew(n - 1)) {
      print("naturalsDownFromNew--for each i  yield $i");
      yield i;
    }
  }
}


void testGeneratorSync(){

  print("\n******-----testGeneratorSync-------------------\n");

  var iter0 = naturalsTo(4);
  print('inte0 = $iter0 ');
  
  var iter1 = naturalsDownFrom(4);
  print('inte1 = $iter1 ');

  var iter2 = naturalsDownFromNew(4);
  print('iter2 = $iter2 ');
}

Stream<int> asynchronousNaturalsTo(n) async* {
  int k = 0;
  while (k <= n) {
    if (k == 6) {
      //comment the following can test exception catch...
      //throw new Exception('Intentional exception');
      k++;
      continue;
    } else {
      yield k++;
    }    
  }
}


Stream get naturals async* {
  int k = 0; while (k<10) { yield await k++; }
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  try{
    await for (var value in stream) {
      sum += value;
    }
  }
  catch(e)
  {
    print('Exception captured. e= ${e.toString()}');
  }
  return sum;
}

Future<int> lastPositive(Stream<int> stream) async =>
    stream.lastWhere((x) => x >= 0);

void testGeneratorAsync() async{

  print("\n******-----testGeneratorAsync-------------------\n");

  var asycStream = asynchronousNaturalsTo(5);
  await for (int i in asycStream) { 
    print('event loop $i'); 
  }

  var asycStream1 = asynchronousNaturalsTo(100);

  var sum = await sumStream(asycStream1);
  print('\nsum=$sum'); // 55


  print('\n');
  var asycSream2 = naturals;
   await for (int ii in asycSream2) { 
    print('--yield await event loop $ii'); 
  } 
  print('\n');

  var asycSream3 = asynchronousNaturalsTo(6);
  var lastPos =await lastPositive(asycSream3);
  print('lastPos=$lastPos\n'); 
}