SELECT
  qry_tblTemp_PDFTextImport.ID,
  qry_tblTemp_PDFTextImport.Field1,
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
      )= ""
    )
  )
  OR (
    (
      (tblStates.StateName) Is Not Null
    )
  )
ORDER BY
  qry_tblTemp_PDFTextImport.ID;
