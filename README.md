# Football Analytics API
## Running the application
    pip install -r requirements.txt 
    python app.py
    
## Importing MySQL database

1. Pull the latest version of the footballanalyticsdb.sql file from git
2. In MySQL Workbench, below the navigator, click on **Administration**
3. Then click **Data Import/Restore**
4. Choose **Import from Self-Contained File**
5. Choose the path of the footballanalyticsdb.sql file that you just pulled from git
6. Click **New** default target schema and create *footballanalyticsdb*
7. Click **Start Import**
8. Below the navigator, click on **Schemas**
9. Refresh the schemas navigator to view the imported database

## Exporting MySQL database (Create new branch making changes)

1. In MySQL Workbench, below the navigator, click on **Administration**
2. Then click **Data Export**
3. Choose **footballanalyticsdb** schema
4. Under **Objects to Export** choose **Dump Stored Procedures and Functions**
5. Choose **Export to Self-Contained File** and overwrite the footballanalyticsdb.sql file
6. Push the file to git
