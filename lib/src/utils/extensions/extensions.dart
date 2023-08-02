extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

extension MapUtils<K, V> on Map<K, V> {
  Map<K, V> filter(bool Function(K, V) condition) {
    Map<K, V> result = {};
    for (var element in entries) {
      if (condition(element.key, element.value)) {
        result[element.key] = element.value;
      }
    }
    return result;
  }
}
