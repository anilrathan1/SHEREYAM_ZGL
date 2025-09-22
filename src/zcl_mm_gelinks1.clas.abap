CLASS zcl_mm_gelinks1 DEFINITION
 PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MM_GELINKS1 IMPLEMENTATION.


METHOD if_sadl_exit_calc_element_read~calculate.
    DATA: lt_data TYPE STANDARD TABLE OF zmm_c_gl.
*          ls_data TYPE zmm_c_gl.d.
    lt_data = CORRESPONDING #( it_original_data ).

    IF lt_data IS NOT INITIAL.
      SELECT * FROM i_materialdocumentitemtp FOR ALL ENTRIES IN @lt_data
      WHERE  materialdocumentyear = @lt_data-materialdocumentyear
        AND  materialdocument = @lt_data-materialdocument
        AND  materialdocumentitem = @lt_data-materialdocumentitem INTO TABLE @DATA(lt_matdocitmtp).

      LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<fs>).
      read TABLE lt_matdocitmtp into DATA(ls_matdocitmtp) WITH KEY materialdocumentyear = <fs>-MaterialDocumentYear
                                              MaterialDocument = <fs>-MaterialDocument
                                              MaterialDocumentItem = <fs>-MaterialDocumentItem.
         if ls_matdocitmtp is NOT INITIAL.
         <fs>-VehicleNumber = ls_matdocitmtp-YY1_VehicleNo1_MMI.
         ENDIF.
      ENDLOOP.
    ENDIF.
    ct_calculated_data = CORRESPONDING #( lt_data ).


  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.
