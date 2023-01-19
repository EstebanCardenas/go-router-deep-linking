part of deep_linking.core;

class SessionService {
  SessionService._(this.state);

  static SessionService instance = SessionService._({});

  Map<String, dynamic> state;

  void set(SessionKey key, dynamic value) {
    state = {
      ...state,
      key.value: value,
    };
  }

  dynamic get(SessionKey key) => state[key.value];
}
