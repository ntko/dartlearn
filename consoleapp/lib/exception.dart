
void testException(bool bIsSystemException) {
  print("\n******-----testException bIsSystemException=$bIsSystemException --------\n");
  try {
    var a = 12.0 / 0.0;
    print("a=$a\n");
    if(bIsSystemException) {
        throw new FormatException('Expected at least 1 section');
    }
    else{
      throw "Custom Exception throwed.";
    }
    
  } on Exception catch (e) {
    print('Exception details:\n $e');
  } catch (e, s) {
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
  } finally {
    print('finally executed\n');
  }
}