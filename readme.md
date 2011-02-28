# Request DB dashboard

A simple app to create a dashboard of information retrieved from a 'request-log-analyzer' sqlite3 database.

## Database
There is an example database that can be used for development, just copy it and overwrite the requests.db if it's available.

    cp db/requests.db.example db/requests.db

## Pipe production data into database
Run request-log-analyzer with the path to the database that this application accesses and the parsed data will be appended to it. You will see the 'processed' count increase as more analyzing jobs have been ran. An example of a command for this is:

    request-log-analyzer --after 2011-02-27 --before 2011-02-28 /tmp/production.log --database db_path/requests.db