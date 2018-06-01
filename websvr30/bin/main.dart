import 'package:websvr30/websvr30.dart';

Future main() async {
  var app = new Application<Websvr30Channel>()
      ..options.configurationFilePath = "config.yaml"
      ..options.port = 8081;

  await app.start(numberOfInstances: 2);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}