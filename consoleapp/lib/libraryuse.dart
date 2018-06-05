export 'src/square.dart' hide toStringTri;
export 'src/triangle.dart' hide toStringSqu;

import 'src/square.dart' hide toStringTri;
import 'src/triangle.dart' hide toStringSqu;

void printall1(){
  print('From libraryuse.dart printall1:${toStringTri()}');
  print('From libraryuse.dart printall1:${toStringSqu()}');
}

void printall2(){
  print('From libraryuse.dart printall2:${toStringTri()}');
  print('From libraryuse.dart printall2:${toStringSqu()}');
}
