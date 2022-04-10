import 'package:universidade/src/performance/domain/entities/performance_entity.dart';

class PerformanceMapper extends PerformanceEntity {
  PerformanceMapper({
    required String aluno,
    required String treinamento,
    required DateTime? dataInicial,
    required DateTime? dataFinal,
    required double? nota,
  }) : super(
          aluno: aluno,
          treinamento: treinamento,
          dataInicial: dataInicial,
          dataFinal: dataFinal,
          nota: nota,
        );

  static Map<String, dynamic> toMap(PerformanceEntity entity) {
    return {
      'aluno': entity.aluno,
      'treinamento': entity.treinamento,
      'dataInicial': entity.dataInicial,
      'dataFinal': entity.dataFinal,
      'nota': entity.nota,
    };
  }

  factory PerformanceMapper.fromMap(Map<String, dynamic> map) {
    return PerformanceMapper(
      aluno: map['nome'] ?? '',
      treinamento: map['treinamento'] ?? '',
      dataInicial: map['dataInicial'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dataInicial'])
          : null,
      dataFinal: map['dataFinal'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dataFinal'])
          : null,
      nota: map['nota']?.toDouble(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PerformanceEntity && other.aluno == aluno;
  }

  @override
  int get hashCode {
    return aluno.hashCode;
  }
}
