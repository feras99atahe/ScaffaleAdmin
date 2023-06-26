// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deprament_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DepramentRecord> _$depramentRecordSerializer =
    new _$DepramentRecordSerializer();

class _$DepramentRecordSerializer
    implements StructuredSerializer<DepramentRecord> {
  @override
  final Iterable<Type> types = const [DepramentRecord, _$DepramentRecord];
  @override
  final String wireName = 'DepramentRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DepramentRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.departmentCover;
    if (value != null) {
      result
        ..add('department_cover')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.departmentName;
    if (value != null) {
      result
        ..add('department_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
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
  DepramentRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DepramentRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'department_cover':
          result.departmentCover = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'department_name':
          result.departmentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
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

class _$DepramentRecord extends DepramentRecord {
  @override
  final String? departmentCover;
  @override
  final String? departmentName;
  @override
  final DocumentReference<Object?>? user;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DepramentRecord([void Function(DepramentRecordBuilder)? updates]) =>
      (new DepramentRecordBuilder()..update(updates))._build();

  _$DepramentRecord._(
      {this.departmentCover, this.departmentName, this.user, this.ffRef})
      : super._();

  @override
  DepramentRecord rebuild(void Function(DepramentRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DepramentRecordBuilder toBuilder() =>
      new DepramentRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DepramentRecord &&
        departmentCover == other.departmentCover &&
        departmentName == other.departmentName &&
        user == other.user &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, departmentCover.hashCode);
    _$hash = $jc(_$hash, departmentName.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DepramentRecord')
          ..add('departmentCover', departmentCover)
          ..add('departmentName', departmentName)
          ..add('user', user)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DepramentRecordBuilder
    implements Builder<DepramentRecord, DepramentRecordBuilder> {
  _$DepramentRecord? _$v;

  String? _departmentCover;
  String? get departmentCover => _$this._departmentCover;
  set departmentCover(String? departmentCover) =>
      _$this._departmentCover = departmentCover;

  String? _departmentName;
  String? get departmentName => _$this._departmentName;
  set departmentName(String? departmentName) =>
      _$this._departmentName = departmentName;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DepramentRecordBuilder() {
    DepramentRecord._initializeBuilder(this);
  }

  DepramentRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _departmentCover = $v.departmentCover;
      _departmentName = $v.departmentName;
      _user = $v.user;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DepramentRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DepramentRecord;
  }

  @override
  void update(void Function(DepramentRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DepramentRecord build() => _build();

  _$DepramentRecord _build() {
    final _$result = _$v ??
        new _$DepramentRecord._(
            departmentCover: departmentCover,
            departmentName: departmentName,
            user: user,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
