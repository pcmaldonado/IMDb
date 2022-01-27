# ETL & Preprocessing (SSIS, SQL)

Data was first extracted from the [IMDb database](https://datasets.imdbws.com/), then imported to MS SQL using Microsoft Visual Studio 2019, using the “Integration Services Project” template and the SSIS toolbox.  The data was imported as “RAW” and all columns as type of strings in order to avoid any kind of errors.

Once the data was in MSSQL, new “working” tables were created through stored procedures (see example [here](https://github.com/pcmaldonado/IMDb/blob/main/Preprocessing/name_basics_procedure_wrk_table.sql)) in order to better fit the data types and other specifications. 

Finally,

- Some tables were discarded as they did not contribute  enough meaningful information,
- Rows and columns with too much missing data were dropped
- New tables were created to better store information in existing tables
    - Example: “primaryProfession” in the “name_basics” table contained, in a single cell, an array of comma separated values for any given person in the dataset. This information was split and put into a unique table containing one profession per cell, with the possibility of containing more than one row per person.

The final representation of the working tables can be visualized as:

![Untitled](https://github.com/pcmaldonado/IMDb/blob/main/Preprocessing/RelationalDatabaseSchema.png)

*(Schema created with SqlDBM using a generated [script](https://github.com/pcmaldonado/IMDb/blob/main/Preprocessing/script.sql) from MSSQL)*