import 'package:universidade/src/company/domain/entities/company_entity.dart';

class CompanyMapper extends CompanyEntity {
  CompanyMapper({
    required String id,
    required String name,
    required String cnpj,
  }) : super(
          id: id,
          name: name,
          cnpj: cnpj,
        );

  static Map<String, dynamic> toMap(CompanyEntity entity) {
    return {
      'id': entity.id,
      'empresa': entity.name,
      'cnpj': entity.cnpj,
    };
  }

  factory CompanyMapper.fromMap(Map<String, dynamic> map) {
    return CompanyMapper(
      id: map['id'] ?? '',
      name: map['empresa'] ?? '',
      cnpj: map['cnpj'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompanyEntity && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
