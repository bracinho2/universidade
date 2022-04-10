import 'dart:convert';

class PerformanceEntity {
  final String aluno;
  final String treinamento;
  final DateTime? dataInicial;
  final DateTime? dataFinal;
  final double? nota;

  const PerformanceEntity({
    required this.aluno,
    required this.treinamento,
    required this.dataInicial,
    required this.dataFinal,
    required this.nota,
  });
}
