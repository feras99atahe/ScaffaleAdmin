import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'favorite_record.g.dart';

abstract class FavoriteRecord
    implements Built<FavoriteRecord, FavoriteRecordBuilder> {
  static Serializer<FavoriteRecord> get serializer =>
      _$favoriteRecordSerializer;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  DocumentReference? get item;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FavoriteRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favorite');

  static Stream<FavoriteRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FavoriteRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FavoriteRecord._();
  factory FavoriteRecord([void Function(FavoriteRecordBuilder) updates]) =
      _$FavoriteRecord;

  static FavoriteRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFavoriteRecordData({
  DocumentReference? createdBy,
  DocumentReference? item,
}) {
  final firestoreData = serializers.toFirestore(
    FavoriteRecord.serializer,
    FavoriteRecord(
      (f) => f
        ..createdBy = createdBy
        ..item = item,
    ),
  );

  return firestoreData;
}
