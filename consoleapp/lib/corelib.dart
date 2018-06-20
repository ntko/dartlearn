
void testLibCoreAsyc() async {
  print("\n******-----testLibCoreAsyc-------------------\n");

  var result0 = await testLibCore();
  print(
      'In testLibCoreAsyc: result0 is ${result0}');
}

testLibCore() async {
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
  print(codeUnitList[0] == 78);

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
  return 'End of testLibCore..';
}
