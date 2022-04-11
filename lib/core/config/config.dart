class Config {
  static Future<String> get host async {
    return deviceHost;
  }

  static const deviceHost = "10.0.2.2";

  static Future<int> get port async {
    return devicePort;
  }

  static const devicePort = 8000;
}
