@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Gate Entry custom fields'
@Search.searchable: false
@Metadata.allowExtensions: true
@AbapCatalog.dataMaintenance: #DISPLAY_ONLY
//@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL

define root view entity ZMM_GLINK
  as select distinct from I_MaterialDocumentItem_2 
{
    key MaterialDocumentYear,
    key MaterialDocument,
    key MaterialDocumentItem,
    Material,
    Plant,
    StorageLocation,
    StorageType,
    StorageBin,
    Batch,
    ShelfLifeExpirationDate,
    ManufactureDate

}
