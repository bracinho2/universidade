class CompanyExtras {
  final DateTime timestamp;
  final EStatus status;

  CompanyExtras({
    required this.timestamp,
    required this.status,
  });
}

enum EStatus {
  cadastrada,
  lida,
  atualizada,
}
