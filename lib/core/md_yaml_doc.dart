// @dart=2.9

import 'dart:collection';

import 'package:collection/collection.dart';

Function _deepEq = const DeepCollectionEquality().equals;

class MdYamlDoc {
  String body;
  LinkedHashMap<String, dynamic> props;

  MdYamlDoc({
    this.body = "",
    this.props,
  }) {
    // ignore: prefer_collection_literals
    props = props ?? LinkedHashMap<String, dynamic>();
  }

  MdYamlDoc.from(MdYamlDoc other) {
    body = other.body;
    props = LinkedHashMap<String, dynamic>.from(other.props);
  }

  @override
  int get hashCode => body.hashCode ^ props.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MdYamlDoc &&
          runtimeType == other.runtimeType &&
          body == other.body &&
          _deepEq(props, other.props);

  @override
  String toString() {
    return 'MdYamlDoc{body: "$body", props: $props}';
  }
}
