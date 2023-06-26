import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'deprament_record.g.dart';

abstract class DepramentRecord
    implements Built<DepramentRecord, DepramentRecordBuilder> {
  static Serializer<DepramentRecord> get serializer =>
      _$depramentRecordSerializer;

  @BuiltValueField(wireName: 'department_cover')
  String? get departmentCover;

  @BuiltValueField(wireName: 'department_name')
  String? get departmentName;

  DocumentReference? get user;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DepramentRecordBuilder builder) => builder
    ..departmentCover = ''
    ..departmentName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Deprament');

  static Stream<DepramentRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DepramentRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DepramentRecord._();
  factory DepramentRecord([void Function(DepramentRecordBuilder) updates]) =
      _$DepramentRecord;

  static DepramentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDepramentRecordData({
  String? departmentCover,
  String? departmentName,
  DocumentReference? user,
}) {
  final firestoreData = serializers.toFirestore(
    DepramentRecord.serializer,
    DepramentRecord(
      (d) => d
        ..departmentCover = departmentCover
        ..departmentName = departmentName
        ..user = user,
    ),
  );

  return firestoreData;
}
