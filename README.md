# MallDatabase
Database Scripts for online shopping mall

### Installation Instructions (Schema Only)

Export Dump 

`mysqldump -u {dbuser} -p --no-data mallex > mallex.sql`

Import Dump

### Naming Convention

- All tables should be in plural then start with a prefix followed by an underscore i.e `us_users`
- All tables where applicable must have a UUID
- All primary keys should be of type integer
- All views should be prefixed by i.e `vw_users`
- All foreign keys should be prefixed by table prefix then followed by fk i.e `us_fk`
- Use timestamps for audit trail purposes ie `created_at` and `updated_at`
- All records should have `created_by` and `updated_at`
-