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
  final int business_id;
  final int module_id;
  final bool is_activate;
  final String created;

  ModuleByBusinessModel(this.id, this.business_id,this.module_id, this.is_activate, this.created);
}