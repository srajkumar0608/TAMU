SELECT
  qry_tblTemp_PDFTextImport.ID,
  qry_tblTemp_PDFTextImport.Field1,
  qry_tblTemp_PDFTextImport.Field2,
  qry_tblTemp_PDFTextImport.Field3,
  tblStates.StateName,
  tblStates.FileName,
  tblStates.StateID
FROM
  qry_tblTemp_PDFTextImport
  LEFT JOIN tblStates ON qry_tblTemp_PDFTextImport.Field1 = tblStates.StateName
WHERE
  (
    (
      (
        qry_tblTemp_PDFTextImport.Field1
      ) Like "*Page:*"
    )
  )
  OR (
    (
      (tblStates.StateName) Is Not Null
    )
  )
  OR (
    (
      (
        qry_tblTemp_PDFTextImport.Field2
      ) Like "*Page:*"
    )
  )
  OR (
    (
      (
        qry_tblTemp_PDFTextImport.Field3
      ) Like "*Page:*"
    )
  )
ORDER BY
  qry_tblTemp_PDFTextImport.ID;
