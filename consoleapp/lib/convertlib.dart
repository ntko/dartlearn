import 'dart:convert';
import 'dart:io';
import 'dart:async';

void testConvertLib() async {
    print("\n******-----testConvertLib -------------------\n");
    // NOTE: Be sure to use double quotes ("),
    // not single quotes ('), inside the JSON string.
    // This string is JSON, not Dart.
    var jsonString = '''
      [
        {"score": 40},
        {"score": 80}
      ]
    ''';

    var scores = jsonDecode(jsonString);
    print("scores is List=$scores");

    var firstScore = scores[0];
    print("firstScore is map =$firstScore");
    
//Encode a supported Dart object into a JSON-formatted string with jsonEncode():

    var scoresInDart = [
      {'score': 40},
      {'score': 80},
      {'score': 100, 'overtime': true, 'special_guest': null}
    ];

    var jsonText = jsonEncode(scoresInDart);
    print("jsonText is =$jsonText");

//Decoding and encoding UTF-8 characters
//Use `utf8.decode()` to decode UTF8-encoded bytes to a Dart string:

    List<int> utf8Bytes = [
      0xc3, 0x8e, 0xc3, 0xb1, 0xc5, 0xa3, 0xc3, 0xa9,
      0x72, 0xc3, 0xb1, 0xc3, 0xa5, 0xc5, 0xa3, 0xc3,
      0xae, 0xc3, 0xb6, 0xc3, 0xb1, 0xc3, 0xa5, 0xc4,
      0xbc, 0xc3, 0xae, 0xc5, 0xbe, 0xc3, 0xa5, 0xc5,
      0xa3, 0xc3, 0xae, 0xe1, 0xbb, 0x9d, 0xc3, 0xb1
    ];

    var funnyWord = utf8.decode(utf8Bytes);

    print("funnyWord is =$funnyWord");
    
//To convert a stream of UTF-8 characters into a Dart string, specify `utf8.decoder` to the Stream `transform()` method:
/*
  Directory current = Directory.current;
  print('current Directory:$current');
  var config = new File(current.path + '/bin/config.txt');
  Stream<List<int>> inputStream = config.openRead();

    var lines = inputStream
        .transform(utf8.decoder)
        .transform(new LineSplitter());
    try {
      await for (var line in lines) {
        print('Got ${line.length} characters from stream');
      }
      print('file is now closed');
    } catch (e) {
      print(e);
    }
    */

//Use `utf8.encode()` to encode a Dart string as a list of UTF8-encoded bytes:

    List<int> encoded = utf8.encode('Îñţérñåţîöñåļîžåţîờñ');

    print("encoded is =$encoded");
}