-- to find the list of tables in db
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
  AND table_type = 'BASE TABLE';


--   delete all the table from the db.
DO $$ 
DECLARE 
    r RECORD; 
BEGIN 
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') 
    LOOP 
        EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE;'; 
    END LOOP; 
END $$;