namespace AbgeordnetenWatch;

model Entity {
  @summary("Die eindeutige Id der Entität")
  @key
  id: integer;

  @summary("Die eindeutige Id des Entitätstyps")
  @encodedName("application/json", "entity_type")
  entityType: string;

  @summary("Das Label / die Bezeichnung der Entität")
  label: string;

  @summary("Der API-Pfad, unter dem die einzelne Entität aufgerufen werden kann")
  @encodedName("application/json", "api_url")
  apiUrl: url;
}
