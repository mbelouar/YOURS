# phpMyAdmin Access Guide for Teammates

## Quick Fix for "Access Denied" Error

If you're getting the error: `Access denied for user 'your_user'@'172.18.0.3'`, follow these steps:

### Option 1: Use the Setup Script (Recommended)

```bash
cd /path/to/YOURS/project
./setup-teammate.sh
```

### Option 2: Manual Setup

1. **Stop and clean existing containers:**

   ```bash
   docker-compose down --volumes --remove-orphans
   docker system prune -f
   ```

2. **Ensure you have the correct .env file:**

   ```bash
   # Copy template if needed
   cp env.template .env
   # Edit .env with your passwords
   ```

3. **Rebuild and start services:**
   ```bash
   docker-compose build --no-cache
   docker-compose up -d
   ```

## phpMyAdmin Login Credentials

### Primary Access (Recommended)

- **URL:** http://localhost:8081
- **Username:** `yours_user`
- **Password:** `your_secure_password_here` (from your .env file)

### Alternative Access

- **Username:** `your_user` (also works now)
- **Password:** `your_secure_password_here`

### Root Access (if needed)

- **Username:** `root`
- **Password:** `your_secure_root_password_here` (from your .env file)

## Troubleshooting

### Check Service Status

```bash
docker ps
```

### View Logs

```bash
docker logs yours-phpmyadmin
docker logs yours-mysql
```

### Test Database Connection

```bash
docker exec yours-mysql mysql -u yours_user -pyour_secure_password_here -e "SELECT 'Connection OK' as status;"
```

## What Was Fixed

1. ✅ Created both `yours_user` and `your_user` in MySQL
2. ✅ Updated database initialization script
3. ✅ Ensured proper permissions for both users
4. ✅ Created setup script for easy teammate onboarding

The error was caused by missing the `your_user` account that some configurations expect. Both users now exist and have full access to the `yours` database.
