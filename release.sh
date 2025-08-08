#!/bin/bash

# Release Helper Script for Research template
# Usage: ./release.sh <version>
# Example: ./release.sh v1.0.0

set -e

VERSION=$1

if [ -z "$VERSION" ]; then
    echo "❌ Error: Version argument required"
    echo "Usage: $0 <version>"
    echo "Example: $0 v1.0.0"
    exit 1
fi

# Validate version format (should start with 'v')
if [[ ! $VERSION =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "❌ Error: Version should follow format vX.Y.Z (e.g., v1.0.0)"
    exit 1
fi

echo "🏷️  Preparing release $VERSION"
echo "================================"

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: Not in a git repository"
    exit 1
fi

# Check for uncommitted changes
if ! git diff-index --quiet HEAD --; then
    echo "⚠️  Warning: You have uncommitted changes"
    echo "Do you want to continue? (y/N)"
    read -r response
    if [[ ! $response =~ ^[Yy]$ ]]; then
        echo "Aborted"
        exit 1
    fi
fi

# Check if tag already exists
if git tag -l | grep -q "^$VERSION$"; then
    echo "❌ Error: Tag $VERSION already exists"
    exit 1
fi

echo "📝 Creating tag $VERSION..."
git tag -a "$VERSION" -m "Release $VERSION - Research Template"

echo "🚀 Pushing tag to trigger release pipeline..."
git push origin "$VERSION"

echo ""
echo "✅ Release $VERSION initiated!"
echo ""
echo "📊 The GitHub Actions workflow will now:"
echo "   1. Render research paper (HTML + PDF)"
echo "   2. Render blog post (HTML)"
echo "   3. Package artifacts into tar.gz files"
echo "   4. Create GitHub release with all files"
echo ""
echo "🔗 Check the progress at:"
echo "   https://github.com/$(git config --get remote.origin.url | sed 's/.*github.com[:/]\([^.]*\).*/\1/')/actions"
echo ""
echo "📦 Release artifacts will be available at:"
echo "   https://github.com/$(git config --get remote.origin.url | sed 's/.*github.com[:/]\([^.]*\).*/\1/')/releases/tag/$VERSION"
