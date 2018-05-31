import 'package:websvr30/websvr30.dart';
import 'package:aqueduct_test/aqueduct_test.dart';

export 'package:websvr30/websvr30.dart';
export 'package:aqueduct_test/aqueduct_test.dart';
export 'package:test/test.dart';
export 'package:aqueduct/aqueduct.dart';

/// A testing harness for websvr30.
///
/// A harness for testing an aqueduct application. Example test file:
///
///         void main() {
///           Harness harness = new Harness()..install();
///
///           test("GET /path returns 200", () async {
///             final req = harness.defaultClient.request("/path");
///             expectResponse(await req.get(), 200);
///           });
///         }
///
class Harness extends TestHarness<Websvr30Channel> {
  @override
  Future beforeStart() async {
    // add initialization code that will run prior to the test application starting
  }

  @override
  Future afterStart() async {
    // add initialization code that will run once the test application has started
  }
}
