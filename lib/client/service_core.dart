abstract class ServiceCore {
  ServiceEndpoint get endpoint;
}

extension StringExtension on ServiceEndpoint {
  String get string {
    switch (this) {
      case ServiceEndpoint.pokemon:
        return 'pokemon';
    }
  }
}

enum ServiceEndpoint { pokemon }
