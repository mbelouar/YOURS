# 🌿 **Branch Management Guide**

## 📋 **Available Branches**

| Branch | Purpose | Developer | Status |
|--------|---------|-----------|---------|
| `main` | Production-ready code | All | ✅ Active |
| `backend-database` | Backend & Database development | Developer 1 | ✅ Ready |
| `ai-analytics` | AI & Analytics development | Developer 2 | ✅ Ready |
| `frontend-ui` | Frontend & UI development | Developer 3 | ✅ Ready |

## 🔄 **Branch Workflow Commands**

### **Switch to Your Branch**
```bash
# Backend Developer
git checkout backend-database

# AI Developer  
git checkout ai-analytics

# Frontend Developer
git checkout frontend-ui
```

### **Daily Workflow**
```bash
# 1. Start your day
git checkout your-branch-name
git pull origin main
git merge main  # if there are new changes

# 2. Work on your features
# ... make changes ...

# 3. End of day
git add .
git commit -m "Add: feature description"
git push origin your-branch-name
```

### **Create Pull Request**
```bash
# After completing a feature
git push origin your-branch-name
# Then create PR through GitHub/GitLab interface
```

### **Merge Approved Changes**
```bash
# After PR is approved and merged to main
git checkout main
git pull origin main
git checkout your-branch-name
git merge main
```

## 🚨 **Important Notes**

- **Never work directly on `main` branch**
- **Always create feature branches from `main`**
- **Test your changes before pushing**
- **Use descriptive commit messages**
- **Keep branches up to date with `main`**

## 📞 **Need Help?**

- Check `TEAM_ROLES.md` for detailed responsibilities
- Review `README.md` for project setup
- Ask team members for guidance
