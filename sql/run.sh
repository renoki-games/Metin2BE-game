## Create db struct and mt2 user with limited privileges
mysql -uroot -ppassword < base/db_create.sql
mysql -uroot -ppassword < base/mt2_user_c.sql

## Create clean metin2 db struct
mysql -uroot -ppassword account < account.sql
mysql -uroot -ppassword common < common.sql
mysql -uroot -ppassword log < log.sql
mysql -uroot -ppassword player < player.sql

## Insert new features in metin2 db struct
mysql -uroot -ppassword common < updates/common__exp_table.sql
mysql -uroot -ppassword common < updates/common__priv_settings.sql
mysql -uroot -ppassword log < updates/log__chat_log.sql
mysql -uroot -ppassword player < updates/player__skill_proto.sql
mysql -uroot -ppassword player < updates/player__updates.sql

### NOTE: DON'T TOUCH updates/post/ queries! (they are just for rare cases!)
