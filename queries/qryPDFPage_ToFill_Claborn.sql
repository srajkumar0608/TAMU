SELECT
  qry_tblTemp_PDFTextImport_Claborn.ID,
  qry_tblTemp_PDFTextImport_Claborn.Field1
FROM
  qry_tblTemp_PDFTextImport_Claborn
WHERE
  (
    (
      (
        qry_tblTemp_PDFTextImport_Claborn.Field1
      ) Like "*NPIP:*"
    )
  )
ORDER BY
  qry_tblTemp_PDFTextImport_Claborn.ID;
