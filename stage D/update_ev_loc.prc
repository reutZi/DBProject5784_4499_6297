CREATE OR REPLACE PROCEDURE update_ev_loc AS
BEGIN
 MERGE INTO EVENTS e
  USING (
    SELECT event_id, 
           location_id
    FROM (
      SELECT e.event_id,
             el.location_id,
             ROW_NUMBER() OVER (PARTITION BY e.event_id ORDER BY DBMS_RANDOM.VALUE) as rn
      FROM EVENTS e
      CROSS JOIN EVENT_LOCATION el
    )
    WHERE rn = 1
  ) r
  ON (e.event_id = r.event_id)
  WHEN MATCHED THEN
    UPDATE SET e.location_id = r.location_id;
  COMMIT;
END;
/
