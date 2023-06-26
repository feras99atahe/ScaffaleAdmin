// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FavoriteRecord> _$favoriteRecordSerializer =
    new _$FavoriteRecordSerializer();

class _$FavoriteRecordSerializer
    implements StructuredSerializer<FavoriteRecord> {
  @override
  final Iterable<Type> types = const [FavoriteRecord, _$FavoriteRecord];
  @override
  final String wireName = 'FavoriteRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FavoriteRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.item;
    if (value != null) {
      result
        ..add('item')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  FavoriteRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FavoriteRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'item':
          result.item = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$FavoriteRecord extends FavoriteRecord {
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DocumentReference<Object?>? item;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FavoriteRecord([void Function(FavoriteRecordBuilder)? updates]) =>
      (new FavoriteRecordBuilder()..update(updates))._build();

  _$FavoriteRecord._({this.createdBy, this.item, this.ffRef}) : super._();

  @override
  FavoriteRecord rebuild(void Function(FavoriteRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FavoriteRecordBuilder toBuilder() =>
      new FavoriteRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FavoriteRecord &&
        createdBy == other.createdBy &&
        item == other.item &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, item.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FavoriteRecord')
          ..add('createdBy', createdBy)
          ..add('item', item)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FavoriteRecordBuilder
    implements Builder<FavoriteRecord, FavoriteRecordBuilder> {
  _$FavoriteRecord? _$v;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  DocumentReference<Object?>? _item;
  DocumentReference<Object?>? get item => _$this._item;
  set item(DocumentReference<Object?>? item) => _$this._item = item;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FavoriteRecordBuilder() {
    FavoriteRecord._initializeBuilder(this);
  }

  FavoriteRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdBy = $v.createdBy;
      _item = $v.item;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FavoriteRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FavoriteRecord;
  }

  @override
  void update(void Function(FavoriteRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FavoriteRecord build() => _build();

  _$FavoriteRecord _build() {
    final _$result = _$v ??
        new _$FavoriteRecord._(createdBy: createdBy, item: item, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
