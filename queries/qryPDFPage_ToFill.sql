SELECT
  qry_tblTemp_PDFTextImport.ID,
  qry_tblTemp_PDFTextImport.Field1
FROM
  qry_tblTemp_PDFTextImport
WHERE
  (
    (
      (
        qry_tblTemp_PDFTextImport.Field1
      ) Like "*(NPIP Contact Representative)*"
    )
  )
ORDER BY
  qry_tblTemp_PDFTextImport.ID;
