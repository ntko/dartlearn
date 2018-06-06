export 'src/square.dart' hide toString;
export 'src/triangle.dart' hide sayHello;

import 'src/square.dart' as Square hide toString;
import 'src/triangle.dart' as Triangle hide sayHello;

void toString(){
  print('From libraryuse.dart toString:${Triangle.toString()}');
}

void sayHello(){
  print('From libraryuse.dart sayHello:${Square.sayHello()}');
}
