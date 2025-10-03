# Database Integration Tasks

- [x] Create backend/db/init.js for database initialization, table creation, and sample data insertion
- [x] Update backend/server.js to set up SQLite database connection and run initialization
- [x] Update backend/routes/auth.js to query users from database
- [x] Update backend/routes/purchases.js for database CRUD operations
- [x] Update backend/routes/transfers.js for database CRUD operations
- [x] Update backend/routes/assignments.js for database CRUD operations
- [x] Update backend/routes/dashboard.js to calculate data from database
- [x] Test the integration by running the server and checking endpoints

## Summary of Backend Changes:
- Created SQLite database connection and initialization
- Created tables: users, purchases, transfers, assignments
- Inserted sample data into all tables
- Updated all routes to use database queries instead of dummy arrays
- Dashboard now calculates real values from database
- All API endpoints tested and working correctly
