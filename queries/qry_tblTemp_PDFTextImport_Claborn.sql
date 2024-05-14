SELECT
  tblTemp_PDFTextImport_Claborn.ID,
  tblTemp_PDFTextImport_Claborn.F1 AS Field1,
  InStr(1, [F1], "NPIP:") AS FindStateLine,
  IIf(
    [FindStateLine] > 0,
    InStr(1, [F1], " ")
  ) AS FindFirstSpace,
  IIf(
    [FindFirstSpace] > 0,
    InStr([FindFirstSpace] + 1, [F1], " ")
  ) AS FindSecondSpace,
  IIf(
    [FindFirstSpace] > 0,
    InStr([FindSecondSpace] + 1, [F1], " ")
  ) AS FindThirdSpace,
  IIf(
    [FindSecondSpace] > 1,
    Mid(
      [F1],
      [FindSecondSpace] + 1,
      ([FindPage] - [FindSecondSpace])-2
    )
  ) AS State,
  InStr(1, [F1], "Page:") AS FindPage,
  Mid(
    [F1],
    [FindPage] + 5,
    Len([F1])-([FindPage])
  ) AS PageNumber
FROM
  tblTemp_PDFTextImport_Claborn;
