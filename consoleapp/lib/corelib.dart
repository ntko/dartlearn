void testLibCoreAsyc() async {
  print("\n******-----testLibCoreAsyc-------------------\n");

/*   var result0 = await _testLibCoreOfString();
  print('In testLibCoreAsyc: result0 is ${result0}');

  result0 = await _testLibCoreOfList();
  print('In testLibCoreAsyc: result0 is ${result0}');

  result0 = await _testLibCoreOfSet();
  print('In testLibCoreAsyc: result0 is ${result0}');

  result0 = await _testLibCoreOfMap();
  print('In testLibCoreAsyc: result0 is ${result0}');

  result0 = await _testLibCoreCommon();
  print('In testLibCoreAsyc: result0 is ${result0}');

  result0 = await _testLibCoreOthers();
  print('In testLibCoreAsyc: result0 is ${result0}'); */

  _testLibCoreOfString();

  _testLibCoreOfList();

  _testLibCoreOfSet();

  _testLibCoreOfMap();

  _testLibCoreCommon();

  _testLibCoreOthers();
}

_testLibCoreOfString() async {
  print("\n******-----begin _testLibCoreOfString------\n");
  // Check whether a string contains another string.
  print("'Never odd or even'.contains('odd')=${
      'Never odd or even'.contains('odd')}");

  // Does a string start with another string?
  print("'Never odd or even'.startsWith('Never')=${
      'Never odd or even'.startsWith('Never')}");

  // Does a string end with another string?
  print("'Never odd or even'.endsWith('even')=${
      'Never odd or even'.endsWith('even')}");

  // Find the location of a string inside a string.
  print("'Never odd or even'.indexOf('odd')=${
      'Never odd or even'.indexOf('odd')}");

// Grab a substring.
  print("'Never odd or even'.substring(6, 9)=${
      'Never odd or even'.substring(6, 9)}");

  // Split a string using a string pattern.
  var parts = 'structured web apps'.split(' ');
  print('parts=$parts');

  // Get a UTF-16 code unit (as a string) by index.
  print("'Never odd or even'[0]=${'Never odd or even'[0]}");

  // Use split() with an empty string parameter to get
  // a list of all characters (as Strings); good for
  // iterating.
  var chars = 'hello'.split('');
  print('chars=$chars');
  for (var char in chars) {
    print(char);
  }

  // Get all the UTF-16 code units in the string.
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  print("codeUnitList = $codeUnitList");
  print("codeUnitList[0] = ${codeUnitList[0]}");

  //Converting to uppercase or lowercase

  // Convert to uppercase.
  print(
      "'structured web apps'.toUpperCase() = ${'structured web apps'.toUpperCase()}");

  // Convert to lowercase.
  print(
      "'STRUCTURED WEB APPS'.toLowerCase() = ${'STRUCTURED WEB APPS'.toLowerCase()}");

//Trimming and empty strings

  // Trim a string.
  print("'  hello  '.trim()=${'  hello  '.trim()}");

  // Check whether a string is empty.
  print("''.isEmpty=${''.isEmpty}");

  // Strings with only white space are not empty.
  print("'  '.isNotEmpty=${'  '.isNotEmpty}");

//Replacing part of a string

  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(new RegExp('NAME'), 'Bob');

  // greetingTemplate didn't change.
  print("greeting =$greeting, greetingTemplate= $greetingTemplate");

//Building a string

  var sb = new StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();

  print('fullString = $fullString');

//Regular expressions

//The RegExp class provides the same capabilities as JavaScript regular expressions. Use regular expressions for efficient searching and pattern matching of strings.

  // Here's a regular expression for one or more digits.
  var numbers = new RegExp(r'\d+');
  var numberDigits = new RegExp(r'\d');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  // contains() can use a regular expression.
  print("allCharacters.contains(numbers)=${allCharacters.contains(numbers)}");
  print("someDigits.contains(numbers)=${someDigits.contains(numbers)}");

  // Replace every match with another string.
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  print("someDigits.replaceAll(numbers, 'XX') = $exedOut");
  var exedOutDigits = someDigits.replaceAll(numberDigits, 'DD');
  print("someDigits.replaceAll(numberDigits, 'DD') = $exedOutDigits");

//You can work directly with the RegExp class, too. The Match class provides access to a regular expression match.
  // Check whether the reg exp has a match in a string.
  print("numbers.hasMatch(someDigits)=${numbers.hasMatch(someDigits)}");

  // Loop through all matches.
  for (var match in numbers.allMatches(someDigits)) {
    print('''
    match=$match,
    match.groupCount=${match.groupCount},
    match.groups=${match.groups},
    match.group=${match.group},
    match.group(0)=${match.group(0)}.
    '''); // 15, then 20
  }
  return 'End of _testLibCoreOfString..';
}

_testLibCoreOfList() async {
  print("\n******-----begin _testLibCoreOfList------\n");
// Use a List constructor.
  var vegetables = new List();
  vegetables.add(1);
  vegetables.add("potato");
  vegetables.add("['add ','a ','list']");
  print('vegetables = $vegetables,lenth=${vegetables.length}');

  // Or simply use a list literal.
  var fruits = <String>['apples', 'oranges'];
  // Add to a list.
  fruits.add('kiwis');
  // Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);
  // Get the list length.
  print('fruits = $fruits,lenth=${fruits.length}');

  // Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  print('After removeAt($appleIndex),fruits = $fruits,lenth=${fruits.length}');

  // Remove all elements from a list.
  fruits.clear();

  //Use indexOf() to find the index of an object in a list:

  fruits = ['bananas', 'apples', 'oranges'];
  print('Reset fruits to $fruits');
  // Access a list item by index.
  print('fruits[0] = ${fruits[0]}');
  print("fruits.indexOf('apples')=${fruits.indexOf('apples')}");

  // Sort a list.
  fruits.sort((a, b) => a.compareTo(b));
  print('After sort,fruits = $fruits');

  return 'End of _testLibCoreOfList..';
}

_testLibCoreOfSet() async {
  print("\n******-----begin _testLibCoreOfSet------\n");

  var ingredients = new Set();
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  // Adding a duplicate item has no effect.
  ingredients.add('gold');
  print('After add,ingredients = $ingredients');

  // Remove an item from a set.
  ingredients.remove('gold');
  print('After remove,ingredients = $ingredients');

  //Use contains() and containsAll() to check whether one or more objects are in a set:

  // Check whether an item is in the set.
  print("ingredients.contains('titanium')=${ingredients.contains('titanium')}");
  // Check whether all the items are in the set.
  var tobeFound = <String>['titanium', 'xenon'];
  print(
      "ingredients.containsAll(tobeFound)=${ingredients.containsAll(tobeFound)}");

  ingredients.forEach(
      (v) => print("ingredients.contains('$v')=${ingredients.contains(v)}"));

  //An intersection is a set whose items are in two other sets.
  ingredients.addAll(['gold', 'titanium', 'xenon']);

  // Create the intersection of two sets.
  var nobleGases = new Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);

  print("ingredients.intersection($nobleGases) = $intersection}");

  return 'End of _testLibCoreOfSet..';
}

_testLibCoreOfMap() async {
  print("\n******-----begin _testLibCoreOfMap------\n");

// Maps can be built from a constructor.
  var map0 = new Map();
  map0.addAll({3: '3.third', 2: '2.second', 4: '4.forth'});

// Maps are parameterized types; you can specify what
// types the key and value should be.

  var map1 = new Map<int, String>();
  map1.addAll({3: '3.third', 2: '2.second', 4: '4.forth'});

//You add, get, and set map items using the bracket syntax.
//Use remove() to remove a key and its value from a map.

  var nobleGases = {3: '3.third', 2: '2.second', 4: '4.forth'};

// Retrieve a value with a key.
  print("nobleGases[2] = ${nobleGases[2]}");
// set a value with a key.
  nobleGases[2] = '2.changed second.';
  print("after changed,nobleGases[2] = ${nobleGases[2]}");
  nobleGases[1] = '1.first.';
  print("after changed,nobleGases = $nobleGases");

// Check whether a map contains a key.
  print("nobleGases.containsKey(6) = ${nobleGases.containsKey(6)}");

// Remove a key and its value.
  nobleGases.remove(1);
  print("after reomve(1),nobleGases = $nobleGases");
  print(
      "after reomve(1),nobleGases.containsKey(1) = ${nobleGases.containsKey(1)}");

  // Maps often use strings as keys.
//You can retrieve all the values or all the keys from a map:
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  print("hawaiianBeaches = $hawaiianBeaches");
// Get all the keys as an unordered collection
// (an Iterable).
  var keys = hawaiianBeaches.keys;
  var keysSet = new Set.from(keys);
  print("new Set.from(keys) = $keysSet");
  print("new Set.from(keys).contains('Oahu') = ${keysSet.contains('Oahu')}");

// Get all the values as an unordered collection
// (an Iterable of Lists).
  var valuesSet = hawaiianBeaches.values;
  print("valuesSet = $valuesSet");
  print(
      "any item of valuesSet contains('Waikiki')? = ${valuesSet.any((v) => v.contains('Waikiki'))}");

  var sortedValues = valuesSet.toList();
  sortedValues.sort((a, b) => a[0].compareTo(b[0]));
  print("sortedValues = $sortedValues");

/* 
To check whether a map contains a key, use containsKey(). 
Because map values can be null, you cannot rely on simply getting 
the value for the key and checking for null to determine the existence 
of a key.
*/
  print(
      "hawaiianBeaches.containsKey('Oahu') = ${hawaiianBeaches.containsKey('Oahu')}");

/*
Use the putIfAbsent() method when you want to assign 
a value to a key if and only if the key does not already 
exist in a map. You must provide a function that returns the value.
*/

  var teamAssignments = {};
  teamAssignments.putIfAbsent('Catcher', () => "Catcher's value");
  teamAssignments.putIfAbsent('Catcher', () => "Catcher's value changed");

  print("teamAssignments = $teamAssignments");

  return 'End of _testLibCoreOfMap..';
}

_testLibCoreCommon() async {
  print("\n******-----begin _testLibCoreCommon------\n");

//Use isEmpty or isNotEmpty to check whether a list, set, or map has items:
  var coffees = [];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  print("coffees.isEmpty = ${coffees.isEmpty}");
  print("teas.isNotEmpty = ${teas.isNotEmpty}");

//To apply a function to each item in a list, set, or map, you can use forEach():

  teas.forEach((tea) => print('I drink $tea'));

//When you invoke forEach() on a map, your function must take two arguments (the key and value):
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  hawaiianBeaches.forEach((k, v) => print('I want to visit $k and swim at $v'));

//Iterables provide the map() method, which gives you all the results in a single object:

  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

//Note: The object returned by map() is an Iterable that’s lazily evaluated:
//your function isn’t called until you ask for an item from the returned object.
//To force your function to be called immediately on each item,
//use map().toList() or map().toSet():

  var loudTeasList = teas.map((tea) => tea.toUpperCase()).toList();
  loudTeasList.forEach(print);

//Use Iterable’s where() method to get all the items that match a condition.
//Use Iterable’s any() and every() methods to check whether some or all
//items match a condition.

  // var teas = ['green', 'black', 'chamomile', 'earl grey'];

  // Chamomile is not caffeinated.
  bool isDecaffeinated(String teaName) =>
      (teaName[0] == 'c') || (teaName[0] == 'e');

  // Use where() to find only the items that return true
  // from the provided function.
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));

  print("decaffeinatedTeas(teas.where) = $decaffeinatedTeas");
  // or teas.where(isDecaffeinated)
  decaffeinatedTeas = teas.where(isDecaffeinated).toList();
  print("decaffeinatedTeas(teas.where).tolist() = $decaffeinatedTeas");

  // Use any() to check whether at least one item in the
  // collection satisfies a condition.
  print("teas.any(isDecaffeinated) = ${teas.any(isDecaffeinated)}");

  // Use every() to check whether all the items in a
  // collection satisfy a condition.
  print("teas.every(isDecaffeinated) = ${teas.every(isDecaffeinated)}");
  return 'End of _testLibCoreCommon..';
}

_printURI(Uri uri) {
  print('uri = $uri');
  print('''
      uri.scheme = ${uri.scheme}
      uri.host = ${uri.host}
      uri.port = ${uri.port}
      uri.path = ${uri.path}
      uri.fragment = ${uri.fragment}
      uri.pathSegments = ${uri.pathSegments}
      uri.queryParameters = ${uri.queryParameters}
      uri.queryParametersAll = ${uri.queryParametersAll}
      uri.query = ${uri.query}
      ''');
}

_testLibCoreOthers() async {
  print("\n******-----begin _testLibCoreOthers------\n");
  //Parsing URIs
  var uri = Uri.parse('http://example.org:8080/foo/bar?a=valueA&b=valueB#frag');
  var uri2 = Uri.parse(
      'http://example.org/foo/bar?a=valueA2&b=valueB2&a=valueA1&b=valueB1');
  var uri3 = Uri.parse('Https://example.org/foo/bar');

  _printURI(uri);
  _printURI(uri2);
  _printURI(uri3);

  //build up a URI from individual parts using the `Uri()` constructor:
  var uri4 = new Uri(
      scheme: 'http',
      host: 'example.org',
      path: '/foo/bar',
      fragment: 'frag',
      queryParameters: {
        'a': ['NewvalueA1', 'NewvalueA2'],
        'b': ['NewvalueB1', 'NewvalueB2'],
      });
  _printURI(uri4);

  print('\nNow begin test datetime...\n');

  // Get the current date and time.
  var y2k = new DateTime.now();
  print('y2k DateTime.now() =$y2k');

  // Specify the month and day.
  y2k = new DateTime(2000, 1, 2); // January 2, 2000
  print('y2k DateTime(2000, 1, 2) =$y2k');
  // Specify the date as a UTC time.
  y2k = new DateTime.utc(2000); // 1/1/2000, UTC
  print('y2k DateTime.utc(2000) =$y2k');
  // Specify a date and time in ms since the Unix epoch.
  y2k = new DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
  print('y2k fromMillisecondsSinceEpoch(946684800000,isUtc: true) =$y2k');
  // Parse an ISO 8601 date.
  y2k = DateTime.parse('2000-01-01T00:00:00Z');
  print("y2k parse('2000-01-01T00:00:00Z') =$y2k");

  // Add one year.
  var y2001 = y2k.add(const Duration(days: 366));
  print("y2k.add(const Duration(days: 366) =$y2001");

  // Subtract 30 days.
  var december2000 = y2001.subtract(const Duration(days: 30));
  print("y2001.subtract(const Duration(days: 30) =$december2000");

  // Calculate the difference between two dates.
  // Returns a Duration object.
  var duration = y2001.difference(y2k);
  print("y2001.difference(y2k)=$duration");

  print('\nNow begin test Comparable class...\n');

  var short = const Line(1);
  var long = const Line(100);
  print('(short.compareTo(long) < 0) = ${(short.compareTo(long) < 0)}');

  print('\nNow begin test Map keys ...\n');

  var p1 = new Person('Bob', 'Smith', '1');
  var p2 = new Person('Bob', 'Smith', '2');
  var p3 = 'not a person';
  print('(p1.hashCode == ${p1.hashCode}),( p2.hashCode == ${p2.hashCode}');
  print('(p1 == p2) = ${(p1 == p2)}');
  print('(p1 != p3) = ${(p1 != p3)}');

  print('\nNow begin test custom FooException class...\n');
  try {
    throw new FooException('This is custom FooException');
  } on FooException catch (e, s) {
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
  } on Exception catch (e) {
    print('Exception details:\n $e');
  } catch (e, s) {
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
  } finally {
    print('finally executed\n');
  }

  return 'End of _testLibCoreOthers..';
}

class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}

class Person {
  final String firstName, lastName, random;

  Person(this.firstName, this.lastName, this.random);

  // Override hashCode using strategy from Effective Java,
  // Chapter 11.
  //*
  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + firstName.hashCode;
    result = 37 * result + lastName.hashCode;
    result += random.hashCode;
    return result;
  }
  // */

  // You should generally implement operator == if you
  // override hashCode.
  //*
  @override
  bool operator ==(dynamic other) {
    if (other is! Person) return false;
    Person person = other;
    return (person.firstName == firstName && person.lastName == lastName);
  }
  // */
}

class FooException implements Exception {
  final String msg;

  const FooException([this.msg]);

  @override
  String toString() => msg ?? 'FooException';
}
