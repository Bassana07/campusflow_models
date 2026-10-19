/// Lit un champ obligatoire d'un JSON et vérifie son type.
///
/// Lance une [FormatException] si le champ est absent ou du mauvais type.
T readField<T>(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is! T) {
    throw FormatException(
      "Champ '$key' manquant ou invalide (attendu : $T, reçu : "
      '${value.runtimeType})',
    );
  }
  return value;
}

/// Lit un champ obligatoire de type liste de chaînes.
List<String> readStringList(Map<String, dynamic> json, String key) {
  final list = readField<List<dynamic>>(json, key);
  for (final item in list) {
    if (item is! String) {
      throw FormatException("Le champ '$key' doit contenir uniquement des String");
    }
  }
  return List<String>.from(list);
}
