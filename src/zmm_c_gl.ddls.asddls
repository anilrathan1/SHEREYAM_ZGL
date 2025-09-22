@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption Gate entry custom fields'
@Metadata.allowExtensions: true
define root view entity ZMM_C_GL
  provider contract transactional_query
  as projection on ZMM_GLINK

{
  key     MaterialDocumentYear,
  key     MaterialDocument,
  key     MaterialDocumentItem,
          Material,
          Plant,
          StorageLocation,
          StorageType,
          StorageBin,
          Batch,
          ShelfLifeExpirationDate,
          ManufactureDate,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_MM_GELINKS1'
          @EndUserText.label: 'Vehicle Number'
//          @UI: { lineItem: [{ position: 120}],identification: [{ position: 120 }] }..
  virtual VehicleNumber : abap.string
}
