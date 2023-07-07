import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_record.g.dart';

abstract class DataRecord implements Built<DataRecord, DataRecordBuilder> {
  static Serializer<DataRecord> get serializer => _$dataRecordSerializer;

  DateTime? get created;

  String? get description;

  String? get bookcover;

  bool? get status;

  String? get author;

  String? get bookstatus;

  String? get journal;

  String? get thesisetype;

  int? get volume;

  String? get filetype;

  String? get publisher;

  DateTime? get publicationData;

  @BuiltValueField(wireName: 'Booktitle')
  String? get booktitle;

  BuiltList<String>? get departmentfilter;

  String? get bookpath;

  DocumentReference? get department;

  bool? get favorite;

  String? get collage;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;



  static void _initializeBuilder(DataRecordBuilder builder) => builder
    ..description = ''
    ..bookcover = ''
    ..status = false
    ..author = ''
    ..bookstatus = ''
    ..booktitle = ''
    ..departmentfilter = ListBuilder()
    ..bookpath = ''
    ..favorite = false
    ..collage = ''
    ..journal = ''
    ..thesisetype= ''
    ..filetype = ''
    ..publisher = ''
    ..volume = '' as int?;


  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Data');

  static Stream<DataRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DataRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DataRecord._();
  factory DataRecord([void Function(DataRecordBuilder) updates]) = _$DataRecord;

  static DataRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDataRecordData({
  DateTime? created,
  String? description,
  String? bookcover,
  bool? status,
  String? author,
  String? bookstatus,
  String? booktitle,
  String? bookpath,
  DocumentReference? department,
  bool? favorite,
  String? collage,
  DateTime? publicationData,
  String? journal,
  String? filetype,
  String? thesisetype,
  String? publisher,
  int? volume,
}) {
  final firestoreData = serializers.toFirestore(
    DataRecord.serializer,
    DataRecord(
      (d) => d
        ..created = created
        ..description = description
        ..bookcover = bookcover
        ..status = status
        ..author = author
        ..bookstatus = bookstatus
        ..booktitle = booktitle
        ..departmentfilter = null
        ..bookpath = bookpath
        ..department = department
        ..favorite = favorite
        ..collage = collage
        ..publicationData = publicationData as DateTime?
        ..journal = journal
        ..filetype = filetype
        ..thesisetype = thesisetype
        ..publisher = publisher
        ..volume = volume as int?,

    ),
  );

  return firestoreData;
}
