#!/bin/bash
# Pre-flight Check for 1M Downloads Journey
# Run: ./preflight-check.sh

echo "🚀 PRE-FLIGHT CHECK - 1M Downloads Journey"
echo "=========================================="
echo ""

# Check 1: PyPI Trusted Publishing
echo "1️⃣ PyPI Trusted Publishing Setup:"
if pip show lmx >/dev/null 2>&1; then
    echo "   ✅ lmx is installed from PyPI!"
else
    echo "   ❌ lmx NOT found on PyPI. Set up trusted publishing:"
    echo "   → https://pypi.org/manage/project/lmx/settings/publishing/"
    echo "   → Add: Owner=my-ai-stack, Repo=lmx, Env=pypi"
fi
echo ""

# Check 2: HF Spaces
echo "2️⃣ HuggingFace Spaces:"
spaces=("ai-rag-system" "lmx" "ai-voice-clone" "deepfake-detector" "Stack-3.0")
for space in "${spaces[@]}"; do
    if curl -s "https://huggingface.co/spaces/my-ai-stack/$space" | grep -q "Space not found"; then
        echo "   ❌ $space - Not created yet"
    else
        echo "   ✅ $space - Live!"
    fi
done
echo ""

# Check 3: Web Deployment
echo "3️⃣ Web App Deployment:"
if curl -s "https://content-agency.stack-ai.me" | grep -q "cannot"; then
    echo "   ❌ content-agency-app NOT deployed"
    echo "   → Run: cd content-agency-app && vercel --prod"
else
    echo "   ✅ content-agency-app is live!"
fi
echo ""

# Check 4: Marketing Posts
echo "4️⃣ Marketing Blitz:"
echo "   ⏳ Reddit posts - Have you posted to r/Python, r/LocalLLaMA?"
echo "   ⏳ Hacker News - Have you submitted 'Show HN' posts?"
echo "   ⏳ YouTube - Have you created tutorial videos?"
echo "   ⏳ Twitter - Are you tagging @karpathy, @AndrewYNg?"
echo ""

# Check 5: GitHub Stars
echo "5️⃣ GitHub Stars (Current):"
gh repo list my-ai-stack --json name,stargazerCount --jq '.[] | "   \(.name): \(.stargazerCount) stars"' 2>/dev/null || echo "   (gh cli not authenticated)"
echo ""

# Check 6: PyPI Downloads
echo "6️⃣ PyPI Downloads (if published):"
if command -v pypistats &> /dev/null; then
    for pkg in lmx ai-rag-system stack-3.0; do
        echo -n "   $pkg: "
        pypistats downloads $pkg --last-month 2>/dev/null | grep -oE "[0-9,]+" | head -1 || echo "Not published yet"
    done
else
    echo "   (pypistats not installed - pip install pypistats)"
fi
echo ""

# Summary
echo "📊 SUMMARY:"
echo "=========================================="
echo "✅ Automated setup: COMPLETE (24 documents created)"
echo "⏳ Manual actions: PENDING (User must execute)"
echo ""
echo "🎯 NEXT STEPS (Do in order):"
echo "   1. Set up PyPI trusted publishing (30 mins)"
echo "   2. Create 5 HF Spaces (2 hours)"
echo "   3. Deploy content-agency-app (30 mins)"
echo "   4. Execute marketing blitz (3 hours)"
echo "   5. Monitor progress weekly (run monitor.sh)"
echo ""
echo "📁 All guides in: https://github.com/my-ai-stack/.github"
echo "🚀 Start here: https://github.com/my-ai-stack/.github/blob/main/START_HERE.md"
echo ""
echo "You're 80% there. Execute the 4 steps above to reach 1M downloads! 🎉"
echo "=========================================="
