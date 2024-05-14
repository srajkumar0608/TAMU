SELECT
  qry_tblTemp_PDFTextImport_Claborn.ID,
  qry_tblTemp_PDFTextImport_Claborn.Field1,
  CInt(
    [qry_tblTemp_PDFTextImport_Claborn].[PageNumber]
  ) AS PageNumber,
  qry_tblStates.StateName,
  qry_tblStates.FileName_Claborn,
  qry_tblStates.StateID
FROM
  qry_tblTemp_PDFTextImport_Claborn
  INNER JOIN qry_tblStates ON qry_tblTemp_PDFTextImport_Claborn.State = qry_tblStates.StateName
WHERE
  (
    (
      (
        qry_tblTemp_PDFTextImport_Claborn.Field1
      ) Like "NPIP:*"
    )
  )
  OR (
    (
      (qry_tblStates.StateName) Is Not Null
    )
  )
ORDER BY
  qry_tblTemp_PDFTextImport_Claborn.ID;
