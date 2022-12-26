import 'dart:convert';

/// Ball predictions obfuscated
final List<String> predictions = String.fromCharCodes(base64.decode(
        'R29vZ2xlfEFwcGxlfE1pY3Jvc29mdHxBbWF6b258U3BhY2VYfFRlc2xhfE5hc2F8TmV0ZmxpeHxNZXRhCg=='))
    .split('|');
