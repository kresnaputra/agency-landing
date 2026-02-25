#!/bin/bash

# Cloudflare Pages Setup Script
# Run this script to prepare your project for Cloudflare Pages deployment

set -e  # Exit on error

echo "🐼 Cloudflare Pages Setup Script"
echo "================================"

# Check for required files
echo "✓ Checking project structure..."

REQUIRED_FILES=("index.html" "_headers" "_redirects" "package.json")
for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✓ Found: $file"
    else
        echo "  ✗ Missing: $file"
        exit 1
    fi
done

# Check Git repository
if [ -d ".git" ]; then
    echo "✓ Git repository initialized"
    
    # Get current branch
    CURRENT_BRANCH=$(git branch --show-current)
    echo "  Current branch: $CURRENT_BRANCH"
    
    # Check for uncommitted changes
    if [ -n "$(git status --porcelain)" ]; then
        echo "⚠️  Warning: You have uncommitted changes"
        echo "   Consider: git add . && git commit -m 'Add Cloudflare Pages config'"
    else
        echo "✓ No uncommitted changes"
    fi
else
    echo "✗ Not a Git repository"
    exit 1
fi

echo ""
echo "📋 Configuration Summary:"
echo "-------------------------"
echo "Project: nexus-agency-website"
echo "Main file: index.html"
echo "Build: Static HTML (no build required)"
echo "Output directory: / (root)"

echo ""
echo "🚀 Next Steps:"
echo "--------------"
echo "1. Go to https://dash.cloudflare.com/"
echo "2. Navigate to Workers & Pages → Pages"
echo "3. Click 'Create a project' → 'Connect to Git'"
echo "4. Select GitHub and authorize"
echo "5. Choose repository: kresnaputra/agency-landing"
echo "6. Configure build settings:"
echo "   - Framework preset: None"
echo "   - Build command: (empty)"
echo "   - Build output directory: /"
echo "7. Click 'Save and Deploy'"
echo ""
echo "🌐 Custom Domain Setup (after deploy):"
echo "1. Go to project Settings → Custom domains"
echo "2. Click 'Set up a custom domain'"
echo "3. Enter your domain"
echo ""
echo "📚 For detailed instructions, see: CLOUDFLARE-SETUP.md"

echo ""
echo "✅ Setup complete! Your project is ready for Cloudflare Pages."
echo "   Deployment URL: https://agency-landing.pages.dev"