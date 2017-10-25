DBRev is a fork of DBV project, a database version control, merged with dbdiff and extended to support multiple projects revision!

**How to install:**
- checkout the project
- run composer update to bring *dbdiff* into this project
- rename **.dbdiff.dist** to **.dbdiff** and edit as needed. You find this file in the root of the project.
- duplicate folder **/data/demo.dist** into your **[project-name]**
- rename **/data/[project-name]/meta/project.dist.php** to **/data/[project-name]/meta/project.php**
- edit **/data/[project-name]/meta/project.php** accordingly;
- create a empty `*prod*` database.

**How it works:**
You must have a development database and start with a empty production database.
First time you use the project, make sure you run DBDiff, that will compare development database with production database and generate differences, for schema, data or both depending on your **.dbdiff** config.

Once you have this file, you should see new revision installed and selected. Click **Run Up** to transfer this initial database state to locally created production database.

After this, every time you change something in development database you can generate a new revision that you can transfer (**Run Up**) to local production. When done, you send it to remote server instalation of DBRev and **Run Up** there.

