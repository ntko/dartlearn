import 'package:websvr/websvr.dart';

Future main() async {
  var app = new Application<WebsvrSink>()
      ..configuration.configurationFilePath = "config.yaml"
      ..configuration.port = 8080;

  await app.start(numberOfInstances: Platform.numberOfProcessors);

  print("Application started on port: ${app.configuration.port},numberOfInstances:${Platform.numberOfProcessors}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}