SELECT
  qry_tblStates_Email.StateEmailIDs,
  qry_tblStates_Email.State,
  qry_tblStates_Email.ToEmailAddress,
  qry_tblStates_Email.CCEmailAddress,
  qry_tblStates_Email.EmailFrom,
  qry_tblStates_Email.Subject,
  qry_tblStates_Email.NameForEmail,
  qry_tblStates.StateName,
  qry_tblStates.FileName,
  qry_tblStates.FileName_Claborn,
  qry_tblStates.StateID
FROM
  qry_tblStates_Email
  INNER JOIN qry_tblStates ON qry_tblStates_Email.State = qry_tblStates.StateID
WHERE
  (
    (
      (qry_tblStates.FileName) Is Not Null
    )
  )
  OR (
    (
      (qry_tblStates.FileName_Claborn) Is Not Null
    )
  );
