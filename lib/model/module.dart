class ModuleModel{
  final int id;
  final String name;
  final String status;
  final String lastUpdate;
  final String created;

  ModuleModel(this.id, this.name,this.status, this.lastUpdate, this.created);
}


class ModuleByBusinessModel{
  final int id;
  final int businessId;
  final int moduleId;
  final int isActivate;
  final String created;

  ModuleByBusinessModel(this.id, this.businessId,this.moduleId, this.isActivate, this.created);
}